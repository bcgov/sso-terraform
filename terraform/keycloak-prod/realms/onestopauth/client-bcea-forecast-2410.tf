module "client_bcea-forecast-2410" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "bcea-forecast-2410"
  client_name = "bcea-forecast-2410"
  valid_redirect_uris = [
    "https://bcea-forecast-d9436d-prod.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
