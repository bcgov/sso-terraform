module "service-account-team-1256-4368" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1256-4368"
  team_id     = 1256
  description = "CSS App Created"
}
