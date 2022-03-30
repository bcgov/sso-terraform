module "client_psa-digital-journeys-2311" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "psa-digital-journeys-2311"
  valid_redirect_uris = [
    "http://localhost:3000",
    "https://digital-journeys-keycloak-dev.apps.silver.devops.gov.bc.ca/auth/realms/psa-digital-journey-dev/broker/ocio/endpoint",
    "https://keycloak.freshworks.club/auth/realms/psa-digital-journey-local/broker/ocio/endpoint"
  ]
  description = "CSS App Created"
}
