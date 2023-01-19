module "service-account-team-1301-4553" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1301-4553"
  team_id     = 1301
  description = "CSS App Created"
}
