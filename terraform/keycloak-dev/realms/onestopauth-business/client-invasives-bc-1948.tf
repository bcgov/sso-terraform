module "client_invasives-bc-1948" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "invasives-bc-1948"
  valid_redirect_uris = [
    "http://127.0.0.1:3000/home/landing",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
