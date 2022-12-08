module "service-account-team-1292-4454" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1292-4454"
  team_id     = 1292
  description = "CSS App Created"
}
