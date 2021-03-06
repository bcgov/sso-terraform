module "client_sso-test-2-2" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sso-test-2-2"
  valid_redirect_uris = [
    "http://localhost",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
