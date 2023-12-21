module "service-account-team-1028-5186" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1028-5186"
  team_id     = 1028
  description = "CSS App Created"
}
