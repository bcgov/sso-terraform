module "client_bcea-forecast-2410" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bcea-forecast-2410"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcea-forecast-d9436d-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
