module "client_invasives-bc-1849" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "invasives-bc-1849"
  valid_redirect_uris = [
    "http://localhost:3000",
    "https://dev-invasivesbci.apps.silver.devops.gov.bc.ca"
  ]
  description = "CSS App Created"
}
