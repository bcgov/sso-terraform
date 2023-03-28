module "service-account-team-1061-4713" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1061-4713"
  team_id     = 1061
  description = "CSS App Created"
}
