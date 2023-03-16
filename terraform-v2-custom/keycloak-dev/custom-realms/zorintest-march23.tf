module "zorintest-march23" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "zorintest-march23"
  enabled    = true
}
