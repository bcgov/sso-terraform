module "client_executive-support-system-3565" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "executive-support-system-3565"
  valid_redirect_uris = [
    "https://cabops.gov.bc.ca/"
  ]
  description = "CSS App Created"
}
