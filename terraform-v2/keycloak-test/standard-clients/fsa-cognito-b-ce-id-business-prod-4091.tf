data "keycloak_authentication_flow" "fsa_cognito_b_ce_id_business_prod_4091_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "fsa-cognito-b-ce-id-business-prod-4091" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "fsa-cognito-b-ce-id-business-prod-4091"
  client_name                         = "FSA Cognito BCeID Business PROD"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.fsa_cognito_b_ce_id_business_prod_4091_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:8080",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080"
  ]
}
