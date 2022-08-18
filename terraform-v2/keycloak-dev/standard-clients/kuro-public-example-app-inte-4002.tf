data "keycloak_authentication_flow" "kuro_public_example_app_inte_4002_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "kuro-public-example-app-inte-4002" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "kuro-public-example-app-inte-4002"
  client_name                         = "kuro_public_example_app_inte"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.kuro_public_example_app_inte_4002_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://test.com",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://test.com"
  ]
}
