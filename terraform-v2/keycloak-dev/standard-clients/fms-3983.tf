data "keycloak_authentication_flow" "fms_3983_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "fms-3983" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "fms-3983"
  client_name                         = "FMS Development"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.fms_3983_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://localhost:4200",
    "https://online.silvacom.com/fmsmof_bcUAT/HarvestPlanner.html"
  ]
}
