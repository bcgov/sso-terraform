module "acrfd-4192" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "acrfd-4192"
  client_name                         = "ACRFD"
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
    "*",
    "http://localhost:4200",
    "http://localhost:4200/admin",
    "https://acrfd-admin-86cabb-dev.apps.silver.devops.gov.bc.ca/admin/",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "*",
    "http://localhost:4200",
    "http://localhost:4200/admin",
    "https://acrfd-admin-86cabb-dev.apps.silver.devops.gov.bc.ca/admin/"
  ]
}
