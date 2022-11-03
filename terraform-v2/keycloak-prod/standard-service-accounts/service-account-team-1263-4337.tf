module "service-account-team-1263-4337" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1263-4337"
  team_id     = 1263
  description = "CSS App Created"
}
