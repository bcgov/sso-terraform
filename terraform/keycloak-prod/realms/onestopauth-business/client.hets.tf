module "client_hets" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id    = data.keycloak_realm.this.id
  client_name = "hets"
  valid_redirect_uris = [
    "https://hets-e0cee6-prod.apps.silver.devops.gov.bc.ca/*",
    "https://hets.th.gov.bc.ca/*"
  ]
  web_origins                = ["+"]
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  enabled                    = false
}
