module "servicebc" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "servicebc"
  enabled    = true
}
