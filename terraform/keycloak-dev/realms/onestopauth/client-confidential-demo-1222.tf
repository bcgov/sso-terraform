module "client_confidential-demo-1222" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "confidential-demo-1222"
  valid_redirect_uris = [
    "http://localhost:3000",
    "http://localhost:3000/*"
  ]
  description = "CSS App Created"
}
