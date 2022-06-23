module "client_digital-journeys-1981" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "digital-journeys-1981"
  client_name = "digital-journeys-1981"
  valid_redirect_uris = [
    "http://localhost:1000"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:1000",
    "+"
  ]
}
