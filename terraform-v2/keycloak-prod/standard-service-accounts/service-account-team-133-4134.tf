module "service-account-team-133-4134" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-133-4134"
  team_id     = 133
  description = "CSS App Created"
}
