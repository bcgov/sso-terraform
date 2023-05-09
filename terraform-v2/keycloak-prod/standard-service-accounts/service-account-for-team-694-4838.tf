module "service-account-team-694-4838" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-694-4838"
  team_id     = 694
  description = "CSS App Created"
}
