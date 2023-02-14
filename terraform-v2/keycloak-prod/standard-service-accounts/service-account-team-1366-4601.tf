module "service-account-team-1366-4601" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1366-4601"
  team_id     = 1366
  description = "CSS App Created"
}
