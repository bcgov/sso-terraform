module "service-account-team-1159-4197" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1159-4197"
  team_id     = 1159
  description = "CSS App Created"
}
