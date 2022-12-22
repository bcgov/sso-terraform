module "service-account-team-1030-4494" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1030-4494"
  team_id     = 1030
  description = "CSS App Created"
}
