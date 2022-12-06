module "service-account-team-661-4450" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-661-4450"
  team_id     = 661
  description = "CSS App Created"
}
