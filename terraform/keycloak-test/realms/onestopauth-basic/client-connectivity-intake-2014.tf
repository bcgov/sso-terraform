module "client_connectivity-intake-2014" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "connectivity-intake-2014"
  valid_redirect_uris = [
    "https://connectivity-rtp-test.apps.silver.devops.gov.bc.ca/home"
  ]
  description = "CSS App Created"
}
