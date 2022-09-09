data "keycloak_authentication_flow" "documize_4092_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "documize-4092" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "documize-4092"
  client_name                         = "Documize"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.documize_4092_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://sso.apps-isd.sd.gov.bc.ca/auth/realms/documize-test/broker/gold/endpoint"
  ]
}
