module "client_tti-ams-1486" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tti-ams-1486"
  valid_redirect_uris = [
    "http://localhost:1000"
  ]
  description = "CSS App Created"
}
