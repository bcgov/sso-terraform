module "service-account-team-1063-4160" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1063-4160"
  team_id     = 1063
  description = "CSS App Created"
}
