data "keycloak_authentication_flow" "front_counter_bc_fider_661_browserflow" {
  realm_id = data.keycloak_realm.this.id
  alias    = "IDIR redirector"
}
module "client_front-counter-bc-fider-661" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "front-counter-bc-fider-661"
  valid_redirect_uris = [
    "https://fcbcdevfider.apps.silver.devops.gov.bc.ca/oauth/_rihqijuv0r/callback"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.front_counter_bc_fider_661_browserflow.id
}
