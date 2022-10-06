module "jon-new-realm" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "jon-awesome-new-realm"
  enabled    = true
}
