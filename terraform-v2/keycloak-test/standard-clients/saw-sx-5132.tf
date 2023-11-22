module "saw-sx-5132" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "saw-sx-5132"
  client_name                         = "SAWSx"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
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
    "https://test-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://test-sawsx.apps.silver.devops.gov.bc.ca/*",
    "https://tst-awp.th.gov.bc.ca/*",
    "https://uat-awp.th.gov.bc.ca/*",
    "https://uat-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://uat-sawsx.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://test-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://test-sawsx.apps.silver.devops.gov.bc.ca/*",
    "https://tst-awp.th.gov.bc.ca/*",
    "https://uat-awp.th.gov.bc.ca/*",
    "https://uat-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://uat-sawsx.apps.silver.devops.gov.bc.ca/*"
  ]
}