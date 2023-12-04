module "roadsafety-digital-forms-gold-4355" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "roadsafety-digital-forms-gold-4355"
  client_name                         = "roadsafety-digital-forms-dev"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
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
    "http://localhost:3000/*",
    "http://localhost:5000/*",
    "http://localhost:5002/*",
    "http://localhost:8080/*",
    "http://localhost:8080/roadside-forms/*",
    "https://dev.jag.gov.bc.ca/roadside-forms/*",
    "https://dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-dh-prohibition-web-app-pilot-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-dh-prohibition-web-app-pilot-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-roadside-forms-app-frontend-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-roadside-forms-app-frontend-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:5000/*",
    "http://localhost:5002/*",
    "http://localhost:8080/*",
    "http://localhost:8080/roadside-forms/*",
    "https://dev.jag.gov.bc.ca/roadside-forms/*",
    "https://dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-dh-prohibition-web-app-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-dh-prohibition-web-app-pilot-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-dh-prohibition-web-app-pilot-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*",
    "https://rsbc-roadside-forms-app-frontend-dev.apps.silver.devops.gov.bc.ca/*",
    "https://rsbc-roadside-forms-app-frontend-dev.apps.silver.devops.gov.bc.ca/roadside-forms/*"
  ]
}
