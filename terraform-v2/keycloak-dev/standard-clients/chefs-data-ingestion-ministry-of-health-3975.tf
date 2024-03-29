data "keycloak_authentication_flow" "chefs_data_ingestion_ministry_of_health_3975_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "chefs-data-ingestion-ministry-of-health-3975" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "chefs-data-ingestion-ministry-of-health-3975"
  client_name                         = "CHEFS Data Ingestion (Ministry of Health)"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.chefs_data_ingestion_ministry_of_health_3975_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8082/*",
    "http://localhost:8083/*"
  ]
}
