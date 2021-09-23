module "client_sso-examples-confidential-563" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sso-examples-confidential-563"
  valid_redirect_uris = [
    "http://localhost:3000",
    "http://localhost:3000/*"
  ]
}
