module "client_connectivity-intake-2014" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "connectivity-intake-2014"
  valid_redirect_uris = [
    "https://connectivity-intake-test.apps.silver.devops.gov.bc.ca/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://connectivity-intake-test.apps.silver.devops.gov.bc.ca/"
  ]
}
