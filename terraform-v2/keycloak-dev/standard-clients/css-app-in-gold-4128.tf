data "keycloak_authentication_flow" "css_app_in_gold_4128_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "css-app-in-gold-4128" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "css-app-in-gold-4128"
  client_name                         = "CSS App in GOLD"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.css_app_in_gold_4128_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://bcgov.github.io/sso-requests-dev/*",
    "https://bcgov.github.io/sso-requests-test/*",
    "https://bcgov.github.io/sso-terraform-dev/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://bcgov.github.io/sso-requests-dev/*",
    "https://bcgov.github.io/sso-requests-test/*",
    "https://bcgov.github.io/sso-terraform-dev/*"
  ]
}
