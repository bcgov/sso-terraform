data "keycloak_authentication_flow" "mod_chefs_local_3831_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "mod-chefs-local-3831" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "mod-chefs-local-3831"
  client_name = "MOD_CHEFS_LOCAL"
  valid_redirect_uris = [
    "http://localhost:8080",
    "http://localhost:8081",
    "http://localhost:8082"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.mod_chefs_local_3831_browserflow.id
}
