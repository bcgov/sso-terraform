module "era-r-2-4534" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "era-r-2-4534"
  client_name                         = "ERA R2 Responders Portal"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = "responders-portal-api ess-backend"
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://era-responders.embc.gov.bc.ca",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://era-responders.embc.gov.bc.ca",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi"
  ]
}
