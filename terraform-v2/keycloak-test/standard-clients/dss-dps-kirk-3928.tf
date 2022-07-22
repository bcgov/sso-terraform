data "keycloak_authentication_flow" "dss_dps_kirk_3928_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "dss-dps-kirk-3928" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "dss-dps-kirk-3928"
  client_name                         = "dss-dps-kirk"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.dss_dps_kirk_3928_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://dps-ops-portal.data.gov.bc.ca/*"
  ]
}
