data "keycloak_authentication_flow" "foi_report_download_3796_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "foi-report-download-3796" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "foi-report-download-3796"
  client_name = "FOI Report Download (TEST)"
  valid_redirect_uris = [
    "https://foi-report-download-556e1b-test.apps.silver.devops.gov.bc.ca",
    "https://foi-report-download-556e1b-test.apps.silver.devops.gov.bc.ca/*",
    "https://test.foireport.analytics.gov.bc.ca",
    "https://test.foireport.analytics.gov.bc.ca/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.foi_report_download_3796_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://foi-report-download-556e1b-test.apps.silver.devops.gov.bc.ca",
    "https://foi-report-download-556e1b-test.apps.silver.devops.gov.bc.ca/*",
    "https://test.foireport.analytics.gov.bc.ca",
    "https://test.foireport.analytics.gov.bc.ca/*",
    "+"
  ]
}
