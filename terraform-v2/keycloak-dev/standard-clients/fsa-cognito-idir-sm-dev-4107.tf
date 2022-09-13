data "keycloak_authentication_flow" "fsa_cognito_idir_sm_dev_4107_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "fsa-cognito-idir-sm-dev-4107" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "fsa-cognito-idir-sm-dev-4107"
  client_name                         = "FSA Cognito IDIR SM DEV"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.fsa_cognito_idir_sm_dev_4107_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://oidcdebugger-3d5c3f-dev.apps.silver.devops.gov.bc.ca/",
    "https://bcgov.github.io/keycloak-example-apps/",
    "https://oidcdebuggersecure-3d5c3f-dev.apps.silver.devops.gov.bc.ca/",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://oidcdebugger-3d5c3f-dev.apps.silver.devops.gov.bc.ca/",
    "https://bcgov.github.io/keycloak-example-apps/",
    "https://oidcdebuggersecure-3d5c3f-dev.apps.silver.devops.gov.bc.ca/"
  ]
}
