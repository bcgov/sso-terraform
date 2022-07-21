data "keycloak_authentication_flow" "router_3949_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "router-3949" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "router-3949"
  client_name = "Router"
  valid_redirect_uris = [
    "https://*"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.router_3949_browserflow.id
}
