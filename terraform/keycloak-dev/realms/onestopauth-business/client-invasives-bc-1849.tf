module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "invasives-bc-1849"
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "capacitor://127.0.0.1:3000/*",
    "capacitor://192.168.1.105:8000/*",
    "capacitor://192.168.1.105:8100/*",
    "capacitor://localhost",
    "capacitor://localhost*",
    "capacitor://localhost:3000/*",
    "capacitor://localhost:8100/*",
    "http://*",
    "http://*:8100/*",
    "http://10.0.0.106:8100",
    "http://10.0.0.106:8100/*",
    "http://127.0.0.1:3000/home/*",
    "http://142.24.10.141:8100",
    "http://142.24.10.141:8100/*",
    "http://192.168.1.105:8000/*",
    "http://192.168.1.105:8100/*",
    "http://192.168.50.58:8100",
    "http://192.168.50.58:8100/*",
    "http://invasivesbc-app.apps.silver.devops.gov.bc.ca",
    "http://invasivesbc-app.apps.silver.devops.gov.bc.ca/*",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "http://localhost:8100",
    "http://localhost:8100/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://invasivesbc-app.apps.silver.devops.gov.bc.ca",
    "https://invasivesbc-app.apps.silver.devops.gov.bc.ca/*",
    "invasivesbc://*",
    "invasivesbc://10.0.0.106:8100",
    "invasivesbc://10.0.0.106:8100/*",
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
    "http://*",
    "http://*:8100/*",
    "http://10.0.0.106:8100",
    "http://10.0.0.106:8100/*",
    "http://127.0.0.1:3000/home/*",
    "http://142.24.10.141:8100",
    "http://142.24.10.141:8100/*",
    "http://192.168.1.105:8000/*",
    "http://192.168.1.105:8100/*",
    "http://192.168.50.58:8100",
    "http://192.168.50.58:8100/*",
    "http://invasivesbc-app.apps.silver.devops.gov.bc.ca",
    "http://invasivesbc-app.apps.silver.devops.gov.bc.ca/*",
    "http://localhost",
    "http://localhost/*",
    "http://localhost:3000",
    "http://localhost:3000/*",
    "http://localhost:8100",
    "http://localhost:8100/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/*",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca/home/landing",
    "https://invasivesbc-app.apps.silver.devops.gov.bc.ca",
    "https://invasivesbc-app.apps.silver.devops.gov.bc.ca/*",
    "invasivesbc://*",
    "invasivesbc://10.0.0.106:8100",
    "invasivesbc://10.0.0.106:8100/*",
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
