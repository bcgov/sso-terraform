module "client_front-counter-bc-fider-661" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "front-counter-bc-fider-661"
  valid_redirect_uris = [
    "https://v191fider.apps.silver.devops.gov.bc.ca/oauth/_hs72sbrfrh/callback"
  ]
  description = "CSS App Created"
}
