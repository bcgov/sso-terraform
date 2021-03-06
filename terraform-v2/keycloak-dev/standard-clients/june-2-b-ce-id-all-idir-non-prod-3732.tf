data "keycloak_authentication_flow" "june_2_b_ce_id_all_idir_non_prod_3732_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "june-2-b-ce-id-all-idir-non-prod-3732" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "june-2-b-ce-id-all-idir-non-prod-3732"
  client_name = "June 2 BCeID All & IDIR Non PROD"
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
    "bceidbusiness",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.june_2_b_ce_id_all_idir_non_prod_3732_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
