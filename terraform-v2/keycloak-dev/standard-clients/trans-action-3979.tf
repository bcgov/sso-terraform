data "keycloak_authentication_flow" "trans_action_3979_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "trans-action-3979" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "trans-action-3979"
  client_name                         = "TransAction"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.trans_action_3979_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "http://localhost:3002/*",
    "http://localhost:44705/*",
    "https://dev-hets.th.gov.bc.ca/",
    "https://dev-transaction.th.gov.bc.ca/",
    "https://dev-transaction.th.gov.bc.ca/*",
    "https://transaction-0-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-122-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-144-55b94d-dev.apps.silver.devops.gov.bc.ca/*",
    "https://transaction-55b94d-dev.apps.silver.devops.gov.bc.ca/*",
    "https://transaction-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-vlpweg-prod.pathfinder.gov.bc.ca/*",
    "https://transaction-vlpweg-test.pathfinder.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:3002/*",
    "http://localhost:44705/*",
    "https://dev-hets.th.gov.bc.ca/",
    "https://dev-transaction.th.gov.bc.ca/",
    "https://dev-transaction.th.gov.bc.ca/*",
    "https://transaction-0-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-122-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-144-55b94d-dev.apps.silver.devops.gov.bc.ca/*",
    "https://transaction-55b94d-dev.apps.silver.devops.gov.bc.ca/*",
    "https://transaction-vlpweg-dev.pathfinder.gov.bc.ca/*",
    "https://transaction-vlpweg-prod.pathfinder.gov.bc.ca/*",
    "https://transaction-vlpweg-test.pathfinder.gov.bc.ca/*"
  ]
}
