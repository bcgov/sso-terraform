data "keycloak_authentication_flow" "gdx_agreements_tracker_4075_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "gdx-agreements-tracker-4075" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "gdx-agreements-tracker-4075"
  client_name                         = "GDX Agreements Tracker"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.gdx_agreements_tracker_4075_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://gdx-agreements-tracker-test.apps.silver.devops.gov.bc.ca/*",
    "https://localhost:3000/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://gdx-agreements-tracker-test.apps.silver.devops.gov.bc.ca/*",
    "https://localhost:3000/*"
  ]
}
