data "keycloak_authentication_flow" "junmin_gold_1_3638_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "junmin-gold-1-3638" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "junmin-gold-1-3638"
  client_name = ""
  valid_redirect_uris = [
    "http://localhost:3001",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.junmin_gold_1_3638_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3001",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
