module "client_psa-digital-journeys-2311" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "psa-digital-journeys-2311"
  valid_redirect_uris = [
    "https://digital-journeys-keycloak-test.apps.silver.devops.gov.bc.ca/auth/realms/psa-digital-journey-test/*",
    "https://digital-journeys-keycloak-test.apps.silver.devops.gov.bc.ca/auth/realms/psa-digital-journey-test/broker/ocio/endpoint"
  ]
  description = "CSS App Created"
}
