module "service-account-team-1124-4172" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1124-4172"
  team_id     = 1124
  description = "CSS App Created"
}
