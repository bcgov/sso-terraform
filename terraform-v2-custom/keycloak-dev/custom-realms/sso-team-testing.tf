module "sso-team-testing" {
  source     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/custom-realm"
  realm_name = "sso-team-testing"
  enabled    = true
}
