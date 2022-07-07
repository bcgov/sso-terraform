data "keycloak_authentication_flow" "geocoder_3933_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "geocoder-3933" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "geocoder-3933"
  client_name = "Geocoder"
  valid_redirect_uris = [
    "http://localhost:1000"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.geocoder_3933_browserflow.id
}
