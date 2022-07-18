data "keycloak_authentication_flow" "tians_gold_testing_confidential_client_3938_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "tians-gold-testing-confidential-client-3938" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "tians-gold-testing-confidential-client-3938"
  client_name = "Tian's Gold Testing - Confidential Client"
  valid_redirect_uris = [
    "http://localhost:3000/*"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.tians_gold_testing_confidential_client_3938_browserflow.id
}
