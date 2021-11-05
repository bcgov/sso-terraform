module "client_tti-poc-1025" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tti-poc-1025"
  valid_redirect_uris = [
    "https://civilresolutionbc--springdev.lightning.force.com/"
  ]
  description = "CSS App Created"
}
