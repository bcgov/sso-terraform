data "keycloak_authentication_flow" "chefs_data_ingestion_ministry_of_health_3800_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "chefs-data-ingestion-ministry-of-health-3800" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "chefs-data-ingestion-ministry-of-health-3800"
  client_name = "CHEFS Data Ingestion (Ministry of Health)"
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8082/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.chefs_data_ingestion_ministry_of_health_3800_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8082/*",
    "+"
  ]
}
