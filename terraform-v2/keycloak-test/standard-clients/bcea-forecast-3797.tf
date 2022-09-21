data "keycloak_authentication_flow" "bcea_forecast_3797_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "bcea-forecast-3797" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "bcea-forecast-3797"
  client_name                         = "BCEA Forecast - UAT"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.bcea_forecast_3797_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcea-forecast-d9436d-test.apps.silver.devops.gov.bc.ca/*"
  ]
}
