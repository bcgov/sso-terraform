module "public-cloud" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "public-cloud"
  enabled    = true
}
