module "testing-nithin" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "testing-nithin"
  enabled    = true
}
