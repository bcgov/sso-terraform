module "zorintest_march23" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "zorintest_march23"
  enabled    = true
}
