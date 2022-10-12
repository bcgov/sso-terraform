module "service-account-team-299-4195" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-299-4195"
  team_id     = 299
  description = "CSS App Created"
}
