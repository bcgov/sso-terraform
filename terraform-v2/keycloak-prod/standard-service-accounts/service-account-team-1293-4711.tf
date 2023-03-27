module "service-account-team-1293-4711" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1293-4711"
  team_id     = 1293
  description = "CSS App Created"
}
