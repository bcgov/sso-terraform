module "on-route-bc-direct-4598" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "on-route-bc-direct-4598"
  client_name                         = "onRouteBCDirect"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
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
    "http://localhost:3000",
    "https://*.silver.devops.gov.bc.ca/",
    "https://onroutebc-202-frontend.apps.silver.devops.gov.bc.ca/",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000",
    "https://*.silver.devops.gov.bc.ca/",
    "https://onroutebc-202-frontend.apps.silver.devops.gov.bc.ca/"
  ]
}
