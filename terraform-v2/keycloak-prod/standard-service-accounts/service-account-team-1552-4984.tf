module "service-account-team-1552-4984" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1552-4984"
  team_id     = 1552
  description = "CSS App Created"
}
