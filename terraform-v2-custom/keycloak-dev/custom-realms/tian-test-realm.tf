module "tian-test-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "tian-test-realm"
  enabled    = true
}
