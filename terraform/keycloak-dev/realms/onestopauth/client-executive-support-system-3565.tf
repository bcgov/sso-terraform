module "client_executive-support-system-3565" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "executive-support-system-3565"
  valid_redirect_uris = [
    "https://dev.cabops.gov.bc.ca/",
    "https://dev.cabops.gov.bc.ca/*",
    "https://dev.cabops.gov.bc.ca/openid-connect/keycloak"
  ]
  description = "CSS App Created"
}
