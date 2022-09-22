data "keycloak_authentication_flow" "gwells_4121_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "gwells-4121" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "gwells-4121"
  client_name                         = "GWELLS"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.gwells_4121_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://gwells-dev-pr-1777.apps.silver.devops.gov.bc.ca/gwells",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://gwells-dev-pr-1777.apps.silver.devops.gov.bc.ca/gwells"
  ]
}
