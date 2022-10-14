module "digital-trust" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "digital-trust"
  enabled    = true
}
