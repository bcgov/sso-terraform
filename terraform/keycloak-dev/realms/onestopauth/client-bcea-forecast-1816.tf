module "client_bcea-forecast-1816" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bcea-forecast-1816"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://meteor-bcea-forecast-d9436d-dev.apps.silver.devops.gov.bc.ca/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://meteor-bcea-forecast-d9436d-dev.apps.silver.devops.gov.bc.ca/"
  ]
}
