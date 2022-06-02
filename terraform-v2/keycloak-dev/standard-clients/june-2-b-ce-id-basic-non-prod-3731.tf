data "keycloak_authentication_flow" "june_2_b_ce_id_basic_non_prod_3731_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "june-2-b-ce-id-basic-non-prod-3731" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "june-2-b-ce-id-basic-non-prod-3731"
  client_name = "June 2 BCeID Basic Non Prod"
  valid_redirect_uris = [
    "http://localhost:6000",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.june_2_b_ce_id_basic_non_prod_3731_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:6000",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
