module "client_jsb-csrs-991" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "jsb-csrs-991"
  valid_redirect_uris = [
    "https://jag-csrs-portal-public-f0b5b6-dev.apps.silver.devops.gov.bc.ca"
  ]
  description = "CSS App Created"
}
