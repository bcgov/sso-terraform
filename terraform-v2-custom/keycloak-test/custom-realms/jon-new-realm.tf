module "health-gateway-gold" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "health-gateway-gold"
  enabled    = true
}
