module "junmin-new-project-4371" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "junmin-new-project-4371"
  client_name                         = "junmin-new-project"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi2*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi2*"
  ]
}
