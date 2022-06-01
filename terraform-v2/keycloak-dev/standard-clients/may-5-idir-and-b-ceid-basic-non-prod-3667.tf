data "keycloak_authentication_flow" "may_5_idir_and_b_ceid_basic_non_prod_3667_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "may-5-idir-and-b-ceid-basic-non-prod-3667" {
  source    = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id  = var.standard_realm_id
  client_id = "may-5-idir-and-b-ceid-basic-non-prod-3667"
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.may_5_idir_and_b_ceid_basic_non_prod_3667_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
