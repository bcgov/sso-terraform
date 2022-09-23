module "service-account-team-795-4127" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-795-4127"
  team_id     = 795
  description = "CSS App Created"
}
