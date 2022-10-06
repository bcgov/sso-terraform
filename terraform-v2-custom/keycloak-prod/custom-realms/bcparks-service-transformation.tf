module "bcparks-service-transformation" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "bcparks-service-transformation"
  enabled    = true
}
