module "service-account-team-827-4163" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-827-4163"
  team_id     = 827
  description = "CSS App Created"
}
