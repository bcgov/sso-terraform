# sso-terraform

![Lifecycle:Stable](https://img.shields.io/badge/Lifecycle-Stable-97ca00)

This repository stores the Terraform scripts to provision BCGov SSO infrastructure in the Gold Keycloak instances.

## Related Repositories

1. [sso-requests](https://github.com/bcgov/sso-requests): stores codebase for the main self-service app; `Common Hosted Single Sign-on (CSS)`.
1. [sso-requests-actions](https://github.com/bcgov/sso-requests-actions): stores the custom GitHub actions used by SSO projects, including this repository.
1. [sso-terraform-modules](https://github.com/bcgov/sso-terraform-modules): stores the custom Terraform modules used this repository.
1. [sso-terraform-dev](https://github.com/bcgov/sso-terraform-dev): stores the sandbox environment of this repository to mimic the workflows and behaviours.
1. [sso-requests-actions](https://github.com/bcgov/sso-requests-actions): stores actions used by sso-terraform repos.

## Custom Realms in Gold cluster

**(deprecated)**

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

This terraform file is applied when the PR is merged into the `main` branch. A github action will trigger, adding the custom realm to the gold cluster. Deleting the `new-realm.tf` file will delete the custom realm when the change is merged into the `main` branch.

- Please use `Kebab case` for the custom realm Terraform files. e.g. `sso-team-test.tf`
