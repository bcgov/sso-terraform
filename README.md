# sso-terraform

![Lifecycle:Stable](https://img.shields.io/badge/Lifecycle-Stable-97ca00)

This repository stores the Terraform scripts to provision BCGov SSO infrastructure in Silver and Gold Keycloak instances.

## Workflow

The general workflow for an SSO integration creation/update is:

1. The requester makes a request via [CSS self-service app](https://bcgov.github.io/sso-requests).
1. The [CSS self-service app](https://bcgov.github.io/sso-requests) backend server dispatches `request` GitHub action.

   - see [.github/workflows/request.yml](.github/workflows/request.yml)

1. The `request` GitHub action creates a PR with the changes and send the PR information to [CSS self-service app](https://bcgov.github.io/sso-requests) backend server.
1. The [CSS self-service app](https://bcgov.github.io/sso-requests) backend server merges the PR via GitHub API endpoint.
1. The [CSS self-service app](https://bcgov.github.io/sso-requests) batch service dispatches `terraform-batch` GitHub actions every given interval.

   - see [.github/workflows/terraform-batch.yml](.github/workflows/terraform-batch.yml)
   - see [.github/workflows/terraform-v2-batch.yml](.github/workflows/terraform-v2-batch.yml)

1. The `terraform-batch` GitHub actions communicate with the [CSS self-service app](https://bcgov.github.io/sso-requests) backend server to check if there is a pending request and if so, applies the Terraform scripts.
1. Once the Terraform scripts applied, it sends the results back to the [CSS self-service app](https://bcgov.github.io/sso-requests) backend server.

## Related Repositories

1. [sso-requests](https://github.com/bcgov/sso-requests): stores codebase for the main self-service app; `Common Hosted Single Sign-on (CSS)`.
1. [sso-requests-actions](https://github.com/bcgov/sso-requests-actions): stores the custom GitHub actions used by SSO projects, including this repository.
1. [sso-terraform-modules](https://github.com/bcgov/sso-terraform-modules): stores the custom Terraform modules used this repository.
1. [sso-terraform-dev](https://github.com/bcgov/sso-terraform-dev): stores the sandbox environment of this repository to mimic the workflows and behaviours.

## Custom Realms in Gold cluster

Gold custom realms are managed by Terrafrom in a separate Terraform backend state. To create a new custom realm, create a new Terraform script that has the required definition of the realm:

```sh
cd terraform-v2-custom/keycloak-<env>/custom-realms
cat >>"new-realm.tf" <<EOF
module "new-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "new-realm"
  enabled    = true
}
EOF
```

also, update the list of `realm_names`, an attribute of `master_viewer_role` located in the individual environment’s main.tf file. This gives the the `viewer` privileges to the `Master Viewer`.

This terraform file is applied when the PR is merged into the `main` branch. A github action will trigger, adding the custom realm to the gold cluster. Deleting the `new-realm.tf` file will delete the custom realm when the change is merged into the `main` branch.

- Please use `Kebab case` for the custom realm Terraform files. e.g. `sso-team-test.tf`
