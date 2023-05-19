module "css-app-in-gold-4128" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "css-app-in-gold-4128"
  client_name                         = "Common Hosted Single Sign-on"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
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
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://bcgov.github.io/sso-requests-dev/*",
    "https://bcgov.github.io/sso-requests-test/*",
    "https://bcgov.github.io/sso-terraform-dev/*",
    "https://sso-requests-c6af30-dev.apps.gold.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://bcgov.github.io/sso-requests-dev/*",
    "https://bcgov.github.io/sso-requests-test/*",
    "https://bcgov.github.io/sso-terraform-dev/*",
    "https://sso-requests-c6af30-dev.apps.gold.devops.gov.bc.ca/*"
  ]
}
