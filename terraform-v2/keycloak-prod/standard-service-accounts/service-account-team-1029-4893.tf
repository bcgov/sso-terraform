module "service-account-team-1029-4893" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1029-4893"
  team_id     = 1029
  description = "CSS App Created"
}
