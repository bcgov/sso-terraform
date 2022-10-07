module "kuro-new-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "kuro-test-new-realm"
  enabled    = true
}
