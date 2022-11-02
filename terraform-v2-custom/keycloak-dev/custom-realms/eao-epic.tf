module "eao-epic" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "eao-epic"
  enabled    = true
}
