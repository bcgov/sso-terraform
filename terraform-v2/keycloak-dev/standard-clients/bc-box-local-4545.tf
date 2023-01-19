module "bc-box-local-4545" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "bc-box-local-4545"
  client_name                         = "BCBox - local"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
    "bceidbusiness",
    "githubbcgov",
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
    "http://127.0.0.1/*",
    "http://127.0.0.1:5173/*",
    "http://127.0.0.1:8080/*",
    "http://127.0.0.1:8081/*",
    "http://localhost/*",
    "http://localhost:5173/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://127.0.0.1/*",
    "http://127.0.0.1:5173/*",
    "http://127.0.0.1:8080/*",
    "http://127.0.0.1:8081/*",
    "http://localhost/*",
    "http://localhost:5173/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*"
  ]
}
