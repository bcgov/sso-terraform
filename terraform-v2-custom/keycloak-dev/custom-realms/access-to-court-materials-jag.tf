module "access-to-court-materials-jag" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "access-to-court-materials-jag"
  enabled    = true
}
