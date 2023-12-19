module "service-account-team-265-5184" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-265-5184"
  team_id     = 265
  description = "CSS App Created"
}
