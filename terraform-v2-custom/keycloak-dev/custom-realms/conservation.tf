module "conservation" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "conservation"
  enabled    = true
}
