module "client_feb-4-22-2740" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "feb-4-22-2740"
  valid_redirect_uris = [
    "https://."
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://.",
    "+"
  ]
}
