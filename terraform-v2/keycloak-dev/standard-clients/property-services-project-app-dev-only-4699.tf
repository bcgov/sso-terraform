module "property-services-project-app-dev-only-4699" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "property-services-project-app-dev-only-4699"
  client_name                         = "Property Services Project (App) (Dev Only)"
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
    "http://localhost:3000/*",
    "https://dev-pims.th.gov.bc.ca/*",
    "https://localhost:3000/*",
    "https://pims-app-3cd915-dev.apps.silver.devops.gov.bc.ca/*",
    "https://pims-app-devin-3cd915-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://dev-pims.th.gov.bc.ca/*",
    "https://localhost:3000/*",
    "https://pims-app-3cd915-dev.apps.silver.devops.gov.bc.ca/*",
    "https://pims-app-devin-3cd915-dev.apps.silver.devops.gov.bc.ca/*"
  ]
}
