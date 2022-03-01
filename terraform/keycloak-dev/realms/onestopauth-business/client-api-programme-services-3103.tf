module "client_api-programme-services-3103" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "api-programme-services-3103"
  valid_redirect_uris = [
    "https://authz-apps-gov-bc-ca.dev.api.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
