module "service-account-team-1092-4406" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1092-4406"
  team_id     = 1092
  description = "CSS App Created"
}
