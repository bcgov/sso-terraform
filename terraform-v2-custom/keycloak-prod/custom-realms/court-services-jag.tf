module "court-services-jag" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "court-services-jag"
  enabled    = true
}
