module "digital-talent" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "digital-talent"
  enabled    = true
}
