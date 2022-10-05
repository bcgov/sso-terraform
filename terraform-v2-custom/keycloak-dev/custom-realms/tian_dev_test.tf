module "new-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "Tian_Dev_Test"
  enabled    = true
}