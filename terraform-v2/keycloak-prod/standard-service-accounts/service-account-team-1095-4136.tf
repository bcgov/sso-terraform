module "service-account-team-1095-4136" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1095-4136"
  team_id     = 1095
  description = "CSS App Created"
}
