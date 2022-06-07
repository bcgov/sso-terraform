data "keycloak_authentication_flow" "june_2_idir_only_testing_3730_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "june-2-idir-only-testing-3730" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "june-2-idir-only-testing-3730"
  client_name = "June 2 IDIR Only Testing"
  valid_redirect_uris = [
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  access_token_lifespan               = 600
  client_session_idle_timeout         = 600
  client_session_max_lifespan         = 600
  client_offline_session_idle_timeout = 600
  client_offline_session_max_lifespan = 600
  idps = [
    "idir",
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.june_2_idir_only_testing_3730_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "+"
  ]
}
