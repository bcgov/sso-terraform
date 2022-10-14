module "moti-custom" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "moti-custom"
  enabled    = true
}
