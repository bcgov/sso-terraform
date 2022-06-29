data "keycloak_authentication_flow" "gdx_public_client_3865_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "gdx-public-client-3865" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "gdx-public-client-3865"
  client_name = "gdx-public-client"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://localhost:3000/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.gdx_public_client_3865_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://localhost:3000/*",
    "+"
  ]
}
