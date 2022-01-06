module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "http://127.0.0.1:3000/home/*",
    "http://192.168.1.105:8000/*",
    "http://localhost/*",
    "http://localhost:3000/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "invasivesbc://127.0.0.1:3000/*",
    "invasivesbc://192.168.1.105:8000/*",
    "invasivesbc://localhost:3000/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
