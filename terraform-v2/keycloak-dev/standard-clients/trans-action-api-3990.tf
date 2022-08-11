data "keycloak_authentication_flow" "trans_action_api_3990_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "trans-action-api-3990" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "trans-action-api-3990"
  client_name                         = "TransAction API"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.trans_action_api_3990_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:3000/api/*",
    "https://localhost:44366",
    "https://localhost:44366/*"
  ]
}
