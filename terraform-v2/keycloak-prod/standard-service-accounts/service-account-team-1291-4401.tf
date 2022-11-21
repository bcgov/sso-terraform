module "service-account-team-1291-4401" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1291-4401"
  team_id     = 1291
  description = "CSS App Created"
}
