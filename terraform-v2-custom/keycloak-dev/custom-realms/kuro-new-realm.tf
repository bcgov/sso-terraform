module "kuro-new-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "kuro-dev-new-realm"
  enabled    = true
}
