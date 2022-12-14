module "service-account-team-765-4462" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-service-account"
  realm_id    = var.standard_realm_id
  client_id   = "service-account-team-765-4462"
  team_id     = 765
  description = "CSS App Created"
}
