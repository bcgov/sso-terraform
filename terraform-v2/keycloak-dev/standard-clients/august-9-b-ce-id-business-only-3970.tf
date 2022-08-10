data "keycloak_authentication_flow" "august_9_b_ce_id_business_only_3970_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "august-9-b-ce-id-business-only-3970" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "august-9-b-ce-id-business-only-3970"
  client_name                         = "test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.august_9_b_ce_id_business_only_3970_browserflow.id
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
