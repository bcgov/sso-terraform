module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "invasives-bc-1849"
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "https://invasivesbc.gov.bc.ca",
    "https://invasivesbc.gov.bc.ca/*",
    "https://invasivesbc.gov.bc.ca/home/landing",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca/home/landing"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://invasivesbc.gov.bc.ca",
    "https://invasivesbc.gov.bc.ca/*",
    "https://invasivesbc.gov.bc.ca/home/landing",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "+"
  ]
}
