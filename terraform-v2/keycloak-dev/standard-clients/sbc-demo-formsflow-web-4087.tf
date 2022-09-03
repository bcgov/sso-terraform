data "keycloak_authentication_flow" "sbc_demo_formsflow_web_4087_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sbc-demo-formsflow-web-4087" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sbc-demo-formsflow-web-4087"
  client_name                         = "sbc-demo-formsflow-web"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.sbc_demo_formsflow_web_4087_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://forms-flow-web-d7202f-test.apps.silver.devops.gov.bc.ca",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://forms-flow-web-d7202f-test.apps.silver.devops.gov.bc.ca"
  ]
}
