module "client_clean-transportation-data-hub-595" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "clean-transportation-data-hub-595"
  valid_redirect_uris = [
    "https://cthub-dev-*.apps.silver.devops.gov.bc.ca/",
    "https://cthub-dev-9.apps.silver.devops.gov.bc.ca/",
    "https://cthub-dev.apps.silver.devops.gov.bc.ca/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
