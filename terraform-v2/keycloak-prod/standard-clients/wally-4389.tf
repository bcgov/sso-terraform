module "wally-4389" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "wally-4389"
  client_name                         = "Wally"
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
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:8080/*",
    "https://wally-grafana.pathfinder.gov.bc.ca/*",
    "https://wally.apps.silver.devops.gov.bc.ca/*",
    "https://wally.nrs.gov.bc.ca/*",
    "https://wally.pathfinder.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://wally-grafana.pathfinder.gov.bc.ca/*",
    "https://wally.apps.silver.devops.gov.bc.ca/*",
    "https://wally.nrs.gov.bc.ca/*",
    "https://wally.pathfinder.gov.bc.ca/*"
  ]
}
