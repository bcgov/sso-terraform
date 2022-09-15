data "keycloak_authentication_flow" "sept_14_idir_first_then_b_ceid_4110_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sept-14-idir-first-then-b-ceid-4110" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sept-14-idir-first-then-b-ceid-4110"
  client_name                         = "Sept 14 IDIR first then BCeid "
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
  browser_authentication_flow  = data.keycloak_authentication_flow.sept_14_idir_first_then_b_ceid_4110_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
}
