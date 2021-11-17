module "client_test-bcei-dw-prod-zorin-1355" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "test-bcei-dw-prod-zorin-1355"
  valid_redirect_uris = [
    "https://DEV"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
