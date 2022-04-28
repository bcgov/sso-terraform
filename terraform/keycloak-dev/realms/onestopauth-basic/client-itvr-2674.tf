module "client_itvr-2674" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "itvr-2674"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://itvr-dev-11.apps.silver.devops.gov.bc.ca/*",
    "https://itvr-dev-62.apps.silver.devops.gov.bc.ca/*",
    "https://itvr-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://itvr-dev-11.apps.silver.devops.gov.bc.ca/*",
    "https://itvr-dev-62.apps.silver.devops.gov.bc.ca/*",
    "https://itvr-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
