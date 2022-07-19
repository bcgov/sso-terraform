module "client_dss-kirk-1750" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "dss-kirk-1750"
  client_name = "dss-kirk-1750"
  valid_redirect_uris = [
    "http://localhost:8101/*",
    "https://kirk-d.data.gov.bc.ca/*",
    "https://kirk-rt-65d6a6-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "http://localhost:8101/*",
    "https://kirk-d.data.gov.bc.ca/*",
    "https://kirk-rt-65d6a6-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
