module "service-account-team-1065-4930" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1065-4930"
  team_id     = 1065
  description = "CSS App Created"
}
