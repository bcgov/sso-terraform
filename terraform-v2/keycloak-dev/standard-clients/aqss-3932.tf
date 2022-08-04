data "keycloak_authentication_flow" "aqss_3932_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "aqss-3932" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aqss-3932"
  client_name                         = "AQSS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.aqss_3932_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://aqadvisories-eservice-ef3999-dev.apps.silver.devops.gov.bc.ca/*",
    "http://localhost:3000",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://aqadvisories-eservice-ef3999-dev.apps.silver.devops.gov.bc.ca/*",
    "http://localhost:3000"
  ]
}
