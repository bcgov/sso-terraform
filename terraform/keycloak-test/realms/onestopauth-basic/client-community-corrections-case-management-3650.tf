module "client_community-corrections-case-management-3650" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "community-corrections-case-management-3650"
  client_name = "community-corrections-case-management-3650"
  valid_redirect_uris = [
    "https://cccm-keycloak-abb712-test.apps.gold.devops.gov.bc.ca/*",
    "https://cccm-keycloak-abb712-test.apps.gold.devops.gov.bc.ca/realms/cccm/broker/idir/endpoint"
  ]
  description = "CSS App Created"
}
