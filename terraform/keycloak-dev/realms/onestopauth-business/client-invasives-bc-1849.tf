module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "capacitor://127.0.0.1:3000/*",
    "capacitor://192.168.1.105:8000/*",
    "capacitor://192.168.1.105:8100/*",
    "capacitor://localhost",
    "capacitor://localhost*",
    "capacitor://localhost:3000/*",
    "capacitor://localhost:8100/*",
    "http://127.0.0.1:3000/home/*",
    "http://192.168.1.105:8000/*",
    "http://192.168.1.105:8100/*",
    "http://invasivesbc_app.apps.silver.devops.gov.bc.ca",
    "http://invasivesbc_app.apps.silver.devops.gov.bc.ca/*",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://invasivesbc_app.apps.silver.devops.gov.bc.ca",
    "https://invasivesbc_app.apps.silver.devops.gov.bc.ca/*",
    "invasivesbc://*",
    "invasivesbc://127.0.0.1:3000/*",
    "invasivesbc://192.168.1.105:8000/*",
    "invasivesbc://192.168.1.105:8100/*",
    "invasivesbc://localhost",
    "invasivesbc://localhost*",
    "invasivesbc://localhost/*",
    "invasivesbc://localhost:3000/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "capacitor://127.0.0.1:3000/*",
    "capacitor://192.168.1.105:8000/*",
    "capacitor://192.168.1.105:8100/*",
    "capacitor://localhost",
    "capacitor://localhost*",
    "capacitor://localhost:3000/*",
    "capacitor://localhost:8100/*",
    "http://127.0.0.1:3000/home/*",
    "http://192.168.1.105:8000/*",
    "http://192.168.1.105:8100/*",
    "http://invasivesbc_app.apps.silver.devops.gov.bc.ca",
    "http://invasivesbc_app.apps.silver.devops.gov.bc.ca/*",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://invasivesbc_app.apps.silver.devops.gov.bc.ca",
    "https://invasivesbc_app.apps.silver.devops.gov.bc.ca/*",
    "invasivesbc://*",
    "invasivesbc://127.0.0.1:3000/*",
    "invasivesbc://192.168.1.105:8000/*",
    "invasivesbc://192.168.1.105:8100/*",
    "invasivesbc://localhost",
    "invasivesbc://localhost*",
    "invasivesbc://localhost/*",
    "invasivesbc://localhost:3000/*",
    "+"
  ]
}
