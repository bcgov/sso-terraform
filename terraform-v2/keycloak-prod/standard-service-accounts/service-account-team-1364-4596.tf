module "service-account-team-1364-4596" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1364-4596"
  team_id     = 1364
  description = "CSS App Created"
}
