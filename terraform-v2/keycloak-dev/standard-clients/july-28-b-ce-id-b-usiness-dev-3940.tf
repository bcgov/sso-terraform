data "keycloak_authentication_flow" "july_28_b_ce_id_b_usiness_dev_3940_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "july-28-b-ce-id-b-usiness-dev-3940" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "july-28-b-ce-id-b-usiness-dev-3940"
  client_name                         = "test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.july_28_b_ce_id_b_usiness_dev_3940_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
}
