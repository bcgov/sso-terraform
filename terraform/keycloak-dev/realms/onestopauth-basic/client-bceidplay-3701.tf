module "client_bceidplay-3701" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bceidplay-3701"
  valid_redirect_uris = [
    "https://bceid-dev.solnspace.com"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://bceid-dev.solnspace.com",
    "+"
  ]
}
