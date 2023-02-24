module "service-account-team-1367-4634" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1367-4634"
  team_id     = 1367
  description = "CSS App Created"
}
