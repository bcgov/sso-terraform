module "service-account-team-1190-4229" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1190-4229"
  team_id     = 1190
  description = "CSS App Created"
}
