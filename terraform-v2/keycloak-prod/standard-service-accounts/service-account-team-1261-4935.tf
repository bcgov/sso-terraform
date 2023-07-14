module "service-account-team-1261-4935" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1261-4935"
  team_id     = 1261
  description = "CSS App Created"
}
