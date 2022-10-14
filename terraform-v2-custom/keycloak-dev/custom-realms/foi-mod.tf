module "foi-mod" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "foi-mod"
  enabled    = true
}
