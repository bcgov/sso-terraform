module "client_work-bc-career-compass-3136" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "work-bc-career-compass-3136"
  valid_redirect_uris = [
    "https://careerdiscoveryquizzes-dev/openid-connect/keycloak"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://careerdiscoveryquizzes-dev/openid-connect/keycloak",
    "+"
  ]
}
