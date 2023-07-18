module "saw-sx-4892" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "saw-sx-4892"
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
    "http://127.0.0.1:3000/*",
    "http://localhost:3000/*",
    "https://dev-awp.th.gov.bc.ca/*",
    "https://dev-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://dev-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://dev-sawsx.apps.silver.devops.gov.bc.ca/*",
    "https://localhost:44317/*",
    "https://localhost:44374/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://127.0.0.1:3000/*",
    "http://localhost:3000/*",
    "https://dev-awp.th.gov.bc.ca/*",
    "https://dev-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://dev-sawsx-hangfire.apps.silver.devops.gov.bc.ca/*",
    "https://dev-sawsx.apps.silver.devops.gov.bc.ca/*",
    "https://localhost:44317/*",
    "https://localhost:44374/*"
  ]
}
