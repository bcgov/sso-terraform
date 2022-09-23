data "keycloak_authentication_flow" "jsb_csrs_4126_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "jsb-csrs-4126" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "jsb-csrs-4126"
  client_name                         = "JSB CSRS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.jsb_csrs_4126_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:8080/*",
    "https://dev.childsupportrecalc.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://dev.childsupportrecalc.gov.bc.ca/*"
  ]
}
