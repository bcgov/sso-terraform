module "client_front-counter-bc-fider-661" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "front-counter-bc-fider-661"
  valid_redirect_uris = [
    "https://fcbc-fider.apps.silver.devops.gov.bc.ca/oauth/_meqcnwz5w5/callback"
  ]
  description = "CSS App Created"
}
