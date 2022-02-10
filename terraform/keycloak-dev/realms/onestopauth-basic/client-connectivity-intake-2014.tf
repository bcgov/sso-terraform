module "client_connectivity-intake-2014" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "connectivity-intake-2014"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://connectivity-intake-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
