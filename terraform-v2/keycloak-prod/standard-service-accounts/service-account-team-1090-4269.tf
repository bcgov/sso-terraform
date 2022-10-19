module "service-account-team-1090-4269" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1090-4269"
  team_id     = 1090
  description = "CSS App Created"
}
