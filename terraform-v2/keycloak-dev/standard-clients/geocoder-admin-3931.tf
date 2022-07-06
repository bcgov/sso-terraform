data "keycloak_authentication_flow" "geocoder_admin_3931_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "geocoder-admin-3931" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "geocoder-admin-3931"
  client_name = "Geocoder Admin"
  valid_redirect_uris = [
    "https://geocoder-config-admin-dev.apps.gov.bc.ca"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.geocoder_admin_3931_browserflow.id
}
