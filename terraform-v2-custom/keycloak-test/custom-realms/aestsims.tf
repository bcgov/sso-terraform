module "aestsims" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "aestsims"
  enabled    = true
}
