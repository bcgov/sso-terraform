module "service-account-team-1623-5148" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1623-5148"
  team_id     = 1623
  description = "CSS App Created"
}
