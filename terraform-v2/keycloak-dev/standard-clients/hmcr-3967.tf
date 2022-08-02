data "keycloak_authentication_flow" "hmcr_3967_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "hmcr-3967" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "hmcr-3967"
  client_name                         = "HMCR"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.hmcr_3967_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://192.168.0.113:3000/*",
    "http://localhost:27238/*",
    "http://localhost:3000/*",
    "http://localhost:44704/*",
    "http://localhost:5767/*",
    "https://dev-hmcr.th.gov.bc.ca/*",
    "https://hmcr-0-d3d940-dev.apps.silver.devops.gov.bc.ca/*",
    "https://hmcr-0-txkggj-dev.pathfinder.gov.bc.ca/*",
    "https://hmcr-504-txkggj-dev.pathfinder.gov.bc.ca/*",
    "https://hmcr-628-d3d940-dev.apps.silver.devops.gov.bc.ca/*",
    "https://hmcr-d3d940-dev.apps.silver.devops.gov.bc.ca/*",
    "https://hmcr-txkggj-dev.pathfinder.gov.bc.ca/*",
    "https://pims-app-3cd915-dev.apps.silver.devops.gov.bc.ca/*"
  ]
}
