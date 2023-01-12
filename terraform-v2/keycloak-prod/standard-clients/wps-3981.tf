module "wps-3981" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "wps-3981"
  client_name                         = "Wildfire Predictive Services"
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
    "https://psu.nrs.gov.bc.ca",
    "https://psu.nrs.gov.bc.ca/auto-spatial-advisory",
    "https://psu.nrs.gov.bc.ca/c-haines",
    "https://psu.nrs.gov.bc.ca/fire-behaviour-calculator*",
    "https://psu.nrs.gov.bc.ca/hfi-calculator",
    "https://psu.nrs.gov.bc.ca/morecast",
    "https://psu.nrs.gov.bc.ca/percentile-calculator",
    "https://wps-prod.apps.silver.devops.gov.bc.ca",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/auto-spatial-advisory",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/c-haines",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/fire-behaviour-calculator*",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/hfi-calculator",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/morecast",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/percentile-calculator",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://psu.nrs.gov.bc.ca",
    "https://psu.nrs.gov.bc.ca/auto-spatial-advisory",
    "https://psu.nrs.gov.bc.ca/c-haines",
    "https://psu.nrs.gov.bc.ca/fire-behaviour-calculator*",
    "https://psu.nrs.gov.bc.ca/hfi-calculator",
    "https://psu.nrs.gov.bc.ca/morecast",
    "https://psu.nrs.gov.bc.ca/percentile-calculator",
    "https://wps-prod.apps.silver.devops.gov.bc.ca",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/auto-spatial-advisory",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/c-haines",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/fire-behaviour-calculator*",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/hfi-calculator",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/morecast",
    "https://wps-prod.apps.silver.devops.gov.bc.ca/percentile-calculator"
  ]
}
