module "visitz-4846" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "visitz-4846"
  client_name                         = "MCFD Mobility"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "azureidir",
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
    "*",
    "https://socialsector-sso-dev.apps.gov.bc.ca/realms/mcfd/broker/keycloak-oidc/endpoint",
    "visitz://mobile-client",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "*",
    "https://socialsector-sso-dev.apps.gov.bc.ca/realms/mcfd/broker/keycloak-oidc/endpoint",
    "visitz://mobile-client"
  ]
}
