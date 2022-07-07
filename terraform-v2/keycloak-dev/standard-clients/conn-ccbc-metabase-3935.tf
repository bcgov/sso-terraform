data "keycloak_authentication_flow" "conn_ccbc_metabase_3935_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "conn-ccbc-metabase-3935" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "conn-ccbc-metabase-3935"
  client_name = "conn-ccbc-metabase"
  valid_redirect_uris = [
    "https://ccbc-metabase-dev.apps.silver.devops.gov.bc.ca/"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.conn_ccbc_metabase_3935_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://ccbc-metabase-dev.apps.silver.devops.gov.bc.ca/",
    "+"
  ]
}
