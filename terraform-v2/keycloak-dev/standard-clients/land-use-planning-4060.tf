data "keycloak_authentication_flow" "land_use_planning_4060_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "land-use-planning-4060" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "land-use-planning-4060"
  client_name                         = "Land Use Planning"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.land_use_planning_4060_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "http://localhost:4200/*",
    "https://localhost:3000/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:4200/*",
    "https://localhost:3000/*"
  ]
}
