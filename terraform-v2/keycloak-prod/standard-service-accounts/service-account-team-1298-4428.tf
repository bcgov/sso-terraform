module "service-account-team-1298-4428" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-1298-4428"
  team_id     = 1298
  description = "CSS App Created"
}
