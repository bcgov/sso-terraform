module "client_wildlife-health-information-system-1618" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "wildlife-health-information-system-1618"
  valid_redirect_uris = [
    "https://whis-ui-dev.apps.silver.devops.gov.bc.ca/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://whis-ui-dev.apps.silver.devops.gov.bc.ca/",
    "+"
  ]
}
