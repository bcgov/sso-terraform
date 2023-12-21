module "service-account-team-1554-5187" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1554-5187"
  team_id     = 1554
  description = "CSS App Created"
}
