module "service-account-team-463-4570" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-463-4570"
  team_id     = 463
  description = "CSS App Created"
}
