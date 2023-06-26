module "service-account-team-1524-4907" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1524-4907"
  team_id     = 1524
  description = "CSS App Created"
}
