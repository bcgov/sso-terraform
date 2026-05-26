# Copilot Instructions

## Repository Overview

This repository provisions BCGov SSO infrastructure — specifically the Gold Keycloak instances that power the [Common Hosted Single Sign-on (CSS)](https://github.com/bcgov/sso-requests) service. Terraform manages Keycloak realms, identity providers, clients, and mappers across dev/test/prod environments simultaneously in a single workspace.

## Architecture

### Directory Layout

- **`terraform-v2/`** — Main Terraform workspace. A single `terraform apply` configures all three Keycloak instances (dev, test, prod) at once via three top-level modules (`module.keycloak_dev`, `module.keycloak_test`, `module.keycloak_prod`).
- **`terraform-v2/keycloak-{dev,test,prod}/`** — Per-environment module implementations. Each instantiates the same set of realm modules from `terraform-modules/` with environment-specific variable values.
- **`terraform-modules/modules/`** — Reusable Terraform modules. `base-realms/` contains one module per identity provider realm. Other modules handle cross-cutting concerns (mappers, auth flows, roles, clients).
- **`terraform-modules/localdev/`** — Local development environment using `podman-compose` to spin up a Keycloak instance for testing module changes.
- **`.github/actions/keycloak/`** — Node.js GitHub Action that handles Keycloak config that Terraform cannot manage (e.g., disabling auth flow executions).

### Realm Architecture

Each Keycloak environment has a **`standard` realm** that acts as the federation hub. It aggregates identity from dedicated per-IDP realms via OIDC broker clients:

| Realm | Identity Provider | Protocol |
|---|---|---|
| `idir` | BC Government IDIR (SiteMinder) | SAML |
| `azureidir` | Azure AD IDIR (MFA) | OIDC |
| `bceidbasic` | BCeID Basic (SiteMinder) | SAML |
| `bceidbusiness` | BCeID Business (SiteMinder) | SAML |
| `bceidboth` | BCeID Basic+Business (SiteMinder) | SAML |
| `github` | GitHub | OIDC |
| `otp` | OTP provider | OIDC |
| `digitalcredential` | Digital Credential (VC) | OIDC |

### Branch → Environment Mapping

| Branch | Target |
|---|---|
| `dev` | SANDBOX (`*.sandbox.loginproxy.gov.bc.ca`) |
| `main` | PRODUCTION (`*.loginproxy.gov.bc.ca`) |
| any other | Workflow fails without making changes |

The CI workflows (`terraform-v2-plan.yml`, `terraform-v2-apply.yml`) only run on `main` or `dev`. Sandbox and production configs should mirror each other; environment differences are passed as `TF_VAR_*` overrides in the workflow.

### State Backend

Remote state is stored in AWS S3 with DynamoDB locking:
- Sandbox: bucket `b46814-dev-keycloak`
- Production: bucket `b46814-prod-keycloak`
- Key: `keycloak/gold` (same for both)

## Local Development

### Setup (requires [asdf](https://asdf-vm.com/))

```bash
make local-setup   # installs tool versions from .tool-versions, pip deps, pre-commit hooks
```

Tool versions are pinned in `.tool-versions`: Terraform 1.11.0, Node.js 24.0.0, Python 3.14.0, tflint 0.43.0, terraform-docs 0.12.1.

### Testing Module Changes Locally

```bash
cd terraform-modules/localdev
podman-compose up                     # start Keycloak on :8080 + Postgres on :5433

# in another terminal, create values.auto.tfvars with:
# username="admin"
# password="admin"
# keycloak_url="http://localhost:8080"

terraform init
terraform apply
```

On first apply, 404 errors may appear due to race conditions — rerunning `terraform apply` resolves them.

### Manual Plan/Apply (for state lock debugging)

```bash
cd terraform-v2
# Edit config.tf to point at the correct bucket
rm -rf .terraform .terraform.lock.hcl
terraform init
terraform plan
# If state locked: terraform force-unlock <ID>
```

## Key Conventions

### Variable Naming Pattern

All variables in `terraform-v2/variables.tf` are prefixed with the environment: `dev_`, `test_`, `prod_`. The per-environment module folders (`keycloak-dev/`, etc.) receive these as unprefixed variables. When adding a new variable, add all three variants.

### Sandbox Config Differences

When sandbox and production configs must diverge, pass the difference as `TF_VAR_*` environment variables in the `dev` branch step of the CI workflow — not as default variable values. This keeps `variables.tf` defaults pointing at production values.

### Module Source Paths

Modules in `terraform-v2/keycloak-*/main.tf` reference `terraform-modules` via relative path (`../../terraform-modules/modules/...`). The Keycloak provider version (currently `5.4.0`) is pinned in both `config.tf` and the CI workflow; keep these in sync.

### Pre-commit Hooks

Enforced on commit: `terraform fmt`, `terraform_docs`, `tflint` (with `terraform_module_pinned_source`, `terraform_typed_variables`, and `terraform_unused_declarations` rules disabled), YAML formatting, and Conventional Commits via gitlint.

Run manually:
```bash
pre-commit run --all-files   # run all hooks
terraform fmt -recursive     # format only
```

### Commit Style

Conventional Commits are enforced (`feat:`, `fix:`, `chore:`, etc.). Commit body is optional (B6 rule is ignored in `.gitlint`).
