data "keycloak_authentication_flow" "conn_ccbc_portal_3934_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "conn-ccbc-portal-3934" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "conn-ccbc-portal-3934"
  client_name                         = "conn-ccbc-portal"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.conn_ccbc_portal_3934_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://ccbc-test.apps.silver.devops.gov.bc.ca/*",
    "https://test.connectingcommunitiesbc.ca/*"
  ]
}
