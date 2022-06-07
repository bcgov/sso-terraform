data "keycloak_authentication_flow" "bc_telemetry_warehouse_3766_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "bc-telemetry-warehouse-3766" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "bc-telemetry-warehouse-3766"
  client_name = "BC Telemetry Warehouse (TEST)"
  valid_redirect_uris = [
    "http://moe-bctw-test.apps.silver.devops.gov.bc.ca/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.bc_telemetry_warehouse_3766_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://moe-bctw-test.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
