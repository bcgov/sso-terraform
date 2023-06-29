module "service-account-team-1362-4914" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1362-4914"
  team_id     = 1362
  description = "CSS App Created"
}
