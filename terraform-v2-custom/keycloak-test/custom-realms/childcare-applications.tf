module "childcare-applications" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "childcare-applications"
  enabled    = true
}
