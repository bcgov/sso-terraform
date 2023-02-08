module "e-tk-sso-4533" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "e-tk-sso-4533"
  client_name                         = "eTk SSO"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  login_theme                  = "bcgov-idp-stopper-no-header-title"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://jh-etk-scweb*",
    "http://jh-etk-scweb-dev.apps.silver.devops.gov.bc.ca/*",
    "http://jh-etk-scweb-dev.pathfinder.bcgov/*",
    "http://jh-etk-scweb-pr*",
    "http://localhost:8080/*",
    "http://localhost:8082/*",
    "https://dev.jag.gov.bc.ca/jh-etk-scweb*",
    "https://jh-etk-scweb*",
    "https://jh-etk-scweb-dev*",
    "https://jh-etk-scweb-dev.apps.silver.devops.gov.bc.ca/*",
    "https://jh-etk-scweb-dev.pathfinder.bcgov/*",
    "https://www.jh-etk-scweb-pr*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://jh-etk-scweb*",
    "http://jh-etk-scweb-dev.apps.silver.devops.gov.bc.ca/*",
    "http://jh-etk-scweb-dev.pathfinder.bcgov/*",
    "http://jh-etk-scweb-pr*",
    "http://localhost:8080/*",
    "http://localhost:8082/*",
    "https://dev.jag.gov.bc.ca/jh-etk-scweb*",
    "https://jh-etk-scweb*",
    "https://jh-etk-scweb-dev*",
    "https://jh-etk-scweb-dev.apps.silver.devops.gov.bc.ca/*",
    "https://jh-etk-scweb-dev.pathfinder.bcgov/*",
    "https://www.jh-etk-scweb-pr*"
  ]
}
