module "client_css-e-forms-1519" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "css-e-forms-1519"
  valid_redirect_uris = [
    "https://keycloak-7d3aa1-dev.apps.silver.devops.gov.bc.ca"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
