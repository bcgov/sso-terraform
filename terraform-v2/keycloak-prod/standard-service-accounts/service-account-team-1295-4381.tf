module "service-account-team-1295-4381" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1295-4381"
  team_id     = 1295
  description = "CSS App Created"
}
