module "mines-digital-services-mds-public-client-4414" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "mines-digital-services-mds-public-client-4414"
  client_name                         = "Mines Digital Services (MDS) (Public Client)"
  access_token_lifespan               = 300
  client_session_idle_timeout         = 1800
  client_session_max_lifespan         = 86400
  client_offline_session_idle_timeout = 1800
  client_offline_session_max_lifespan = 1800
  idps = [
    "idir",
    "azureidir",
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
    "https://mds-prod.apps.silver.devops.gov.bc.ca/*",
    "https://metabase-4c2ba9-prod.apps.silver.devops.gov.bc.ca/*",
    "https://minesdigitalservices.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://mds-prod.apps.silver.devops.gov.bc.ca/*",
    "https://metabase-4c2ba9-prod.apps.silver.devops.gov.bc.ca/*",
    "https://minesdigitalservices.gov.bc.ca/*"
  ]
}
