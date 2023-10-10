module "invasives-bc-4565" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "invasives-bc-4565"
  client_name                         = "InvasivesBC"
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
    "https://invasivesbc.gov.bc.ca/",
    "https://invasivesbc.gov.bc.ca/home/landing",
    "https://prod-invasivesbci-appv2.apps.silver.devops.gov.bc.ca",
    "https://prod-invasivesbci-appv2.apps.silver.devops.gov.bc.ca/",
    "invasivesbc://localhost/",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://invasivesbc.gov.bc.ca/",
    "https://invasivesbc.gov.bc.ca/home/landing",
    "https://prod-invasivesbci-appv2.apps.silver.devops.gov.bc.ca",
    "https://prod-invasivesbci-appv2.apps.silver.devops.gov.bc.ca/",
    "invasivesbc://localhost/"
  ]
}
