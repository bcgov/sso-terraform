module "fom-4147" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "fom-4147"
  client_name                         = "fom"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://fom-nrs.apps.silver.devops.gov.bc.ca/*",
    "https://fom-prd.apps.silver.devops.gov.bc.ca/*",
    "https://fom.nrs.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://fom-nrs.apps.silver.devops.gov.bc.ca/*",
    "https://fom-prd.apps.silver.devops.gov.bc.ca/*",
    "https://fom.nrs.gov.bc.ca/*"
  ]
}
