module "client_roadsafety-digital-forms-2443" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "roadsafety-digital-forms-2443"
  valid_redirect_uris = [
    "https://rsbc-dh-prohibition-web-app-pr-104.apps.silver.devops.gov.bc.ca/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://rsbc-dh-prohibition-web-app-pr-104.apps.silver.devops.gov.bc.ca/*"
  ]
}
