module "service-account-team-1487-4862" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1487-4862"
  team_id     = 1487
  description = "CSS App Created"
}
