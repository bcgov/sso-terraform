data "keycloak_authentication_flow" "tracks_3768_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "tracks-3768" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "tracks-3768"
  client_name = "Tracks"
  valid_redirect_uris = [
    "https://moe-tracks-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.tracks_3768_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://moe-tracks-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
