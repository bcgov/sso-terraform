module "spd-licensing-portal-5051" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "spd-licensing-portal-5051"
  client_name                         = "SPD Licensing Portal"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbusiness",
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
    "http://localhost:4200/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi",
    "https://spd-licensing-portal-dev.apps.emerald.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:4200/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi",
    "https://spd-licensing-portal-dev.apps.emerald.devops.gov.bc.ca/*"
  ]
}
