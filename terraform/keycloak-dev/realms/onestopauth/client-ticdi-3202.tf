module "client_ticdi-3202" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "ticdi-3202"
  valid_redirect_uris = [
    "http://nr-ticdi-git-c57b8f-dev.apps.silver.devops.gov.bc.ca"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://nr-ticdi-git-c57b8f-dev.apps.silver.devops.gov.bc.ca",
    "+"
  ]
}
