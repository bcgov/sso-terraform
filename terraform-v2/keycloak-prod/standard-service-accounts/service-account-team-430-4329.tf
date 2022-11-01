module "service-account-team-430-4329" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-430-4329"
  team_id     = 430
  description = "CSS App Created"
}
