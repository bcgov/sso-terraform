module "service-account-team-1497-4886" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1497-4886"
  team_id     = 1497
  description = "CSS App Created"
}
