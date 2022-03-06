module "client_jsb-csrs-991" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "jsb-csrs-991"
  valid_redirect_uris = [
    "http://localhost:8080",
    "https://test.childsupportrecalc.gov.bc.ca"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:8080",
    "https://test.childsupportrecalc.gov.bc.ca",
    "+"
  ]
}
