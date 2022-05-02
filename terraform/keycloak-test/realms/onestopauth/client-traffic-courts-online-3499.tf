module "client_traffic-courts-online-3499" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "traffic-courts-online-3499"
  valid_redirect_uris = [
    "https://staff-web-0198bb-test.apps.silver.devops.gov.bc.ca"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://staff-web-0198bb-test.apps.silver.devops.gov.bc.ca",
    "+"
  ]
}
