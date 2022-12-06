module "client_test-silver-b-ce-id-both-dev-2179" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "test-silver-b-ce-id-both-dev-2179"
  client_name = "test-silver-b-ce-id-both-dev-2179"
  valid_redirect_uris = [
    "http://localhost:6000",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:6000",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
