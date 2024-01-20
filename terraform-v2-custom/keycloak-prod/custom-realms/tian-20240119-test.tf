module "tian-20240119-test" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "tian-20240119-test"
  enabled    = true
}
