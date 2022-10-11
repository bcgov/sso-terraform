module "zorin-dev-custom-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "zorin-dev-custom-realm"
  enabled    = true
}
