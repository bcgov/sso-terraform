data "keycloak_authentication_flow" "sabc_applications_vss_4100_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sabc-applications-vss-4100" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sabc-applications-vss-4100"
  client_name                         = "SABC Applications - VSS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.sabc_applications_vss_4100_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://tbtb-vss-06cb9b-dev.apps.silver.devops.gov.bc.ca/sso-login",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://tbtb-vss-06cb9b-dev.apps.silver.devops.gov.bc.ca/sso-login"
  ]
}
