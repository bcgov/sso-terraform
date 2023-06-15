module "service-account-team-1522-4897" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1522-4897"
  team_id     = 1522
  description = "CSS App Created"
}
