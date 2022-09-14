data "keycloak_authentication_flow" "local_chefs_4109_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "local-chefs-4109" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "local-chefs-4109"
  client_name                         = "CHEFS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.local_chefs_4109_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://localhost:8080",
    "http://localhost:8081",
    "http://localhost:8082"
  ]
}
