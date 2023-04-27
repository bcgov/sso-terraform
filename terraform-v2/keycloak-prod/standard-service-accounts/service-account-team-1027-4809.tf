module "service-account-team-1027-4809" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1027-4809"
  team_id     = 1027
  description = "CSS App Created"
}
