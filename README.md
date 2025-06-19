# sso-terraform

![Lifecycle:Stable](https://img.shields.io/badge/Lifecycle-Stable-97ca00)

This repository stores the Terraform scripts to provision BCGov SSO infrastructure in the Gold Keycloak instances.

## Related Repositories

1. [sso-requests](https://github.com/bcgov/sso-requests): stores codebase for the main self-service app; `Common Hosted Single Sign-on (CSS)`.
1. [sso-requests-actions](https://github.com/bcgov/sso-requests-actions): stores the custom GitHub actions used by SSO projects, including this repository.
1. ~~[sso-terraform-modules](https://github.com/bcgov/sso-terraform-modules): stores the custom Terraform modules used this repository.~~ **DEPRECATED**
1. ~~[sso-terraform-dev](https://github.com/bcgov/sso-terraform-dev): stores the sandbox environment of this repository to mimic the workflows and behaviours.~~ **DEPRECATED**
1. [sso-requests-actions](https://github.com/bcgov/sso-requests-actions): stores actions used by sso-terraform repos.

## terraform-modules

Formerly the sso-keycloak terraform config modules were stored in a separate repos, with a separate branch structure.  As of June 19 2025, these modules are all stored in the folder [terraform-modules](./terraform-modules/).  Config on the dev branch will be deployed to sandbox.  Config on the main branch will be deployed to production.

The sso-requests repos uses the dev branch code for it's local development environment.

## The actions

There are currently 3 actions in this repo that modify the terraform state of the loginproxy deployments.  When the actions are run against the `dev` branch changes are applied to the SANDBOX environments.  When run against `main` the actions are run against the production environments.  When run against any other branch the actions will fail without making changes.

**NOTE: As a design strategy the sandbox and production configuration should mirror each other as closely as possible. However when this is not possible please pass the sandbox config difference into the `TF_VAR`s of the SANDBOX environment creation step of the actions.**
### Terraform Plan

Before attempting to apply terraform changes, run the terraform plan action.  It will give an idea of what changes will take place.

`sso-terraform/.github/workflows/terraform-v2-plan.yml`

### Terraform Apply

This action will apply the configuration changes to `dev`, `test`, and `prod` environments in the `SANDBOX` or `PRODUCTION` environment.

`sso-terraform/.github/workflows/terraform-v2-apply.yml`


## Debugging

If the terraform plan and apply actions are failing do to a failure to release the state lock.  This can be unlocked by doing the following:

 - Log into the AWS dev/prod environment in a local terminal.
 - Change the local config.tf to point at the correct `bucket` and `dynamodb_table`
 - In the folder `./terraform-v2` remove the existing .terraform folder and the .terraform.lock.hcl files
 - In the folder `./terraform-v2` run `terraform init` and `terraform plan`.
 - If that errors out with a state issue reset the state using, `terraform force-unlock <<ID>>`. The GitHub actions should run smoothly again.
