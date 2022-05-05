module "client_bc-public-service-agency-bi-3670" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bc-public-service-agency-bi-3670"
  valid_redirect_uris = [
    "http://localhost:9595"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:9595",
    "+"
  ]
}
