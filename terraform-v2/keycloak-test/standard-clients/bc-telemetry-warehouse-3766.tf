module "bc-telemetry-warehouse-3766" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "bc-telemetry-warehouse-3766"
  client_name                         = "BC Telemetry Warehouse (TEST)"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://moe-bctw-test.apps.silver.devops.gov.bc.ca",
    "http://moe-bctw-test.apps.silver.devops.gov.bc.ca/",
    "http://moe-bctw-test.apps.silver.devops.gov.bc.ca/*"
  ]
}
