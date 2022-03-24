module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "http://127.0.0.1:3000/home/landing",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "invasivesbc://*",
    "invasivesbc://localhost",
    "invasivesbc://localhost*",
    "invasivesbc://localhost/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://127.0.0.1:3000/home/landing",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://test-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "invasivesbc://*",
    "invasivesbc://localhost",
    "invasivesbc://localhost*",
    "invasivesbc://localhost/*",
    "+"
  ]
}
