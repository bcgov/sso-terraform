module "client_roadsafety-digital-forms" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id    = data.keycloak_realm.this.id
  client_name = "roadsafety-digital-forms"
  valid_redirect_uris = [
    "https://rsbc-dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-dh-prohibition-web-app-pr-96.apps.silver.devops.gov.bc.ca/*",
    "http://localhost:8080/*"
  ]
  web_origins           = ["+"]
  access_type           = "PUBLIC"
  access_token_lifespan = "28800"
}
