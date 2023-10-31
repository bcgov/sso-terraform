module "service-account-team-1618-5117" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1618-5117"
  team_id     = 1618
  description = "CSS App Created"
}
