module "client_coms-showcase-frontend-localhost-2872" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coms-showcase-frontend-localhost-2872"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:3001/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "http://localhost:3001/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "+"
  ]
}
