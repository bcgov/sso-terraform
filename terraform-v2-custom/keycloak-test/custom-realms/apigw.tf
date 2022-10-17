module "apigw" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "apigw"
  enabled    = true
}
