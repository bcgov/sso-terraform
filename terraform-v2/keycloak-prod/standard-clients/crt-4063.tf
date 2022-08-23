data "keycloak_authentication_flow" "crt_4063_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "crt-4063" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "crt-4063"
  client_name                         = "CRT"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.crt_4063_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://crt.th.gov.bc.ca/",
    "https://crt.th.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://crt.th.gov.bc.ca/",
    "https://crt.th.gov.bc.ca/*"
  ]
}
