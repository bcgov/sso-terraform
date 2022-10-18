module "digitaltrust-citz" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "digitaltrust-citz"
  enabled    = true
}
