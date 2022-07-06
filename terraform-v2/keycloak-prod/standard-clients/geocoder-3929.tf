data "keycloak_authentication_flow" "geocoder_3929_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "geocoder-3929" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "geocoder-3929"
  client_name = "Geocoder"
  valid_redirect_uris = [
    "https://data-integration-geocoder-config-admin.apps.gov.bc.ca/int/",
    "https://geocoder-config-admin-prod.apps.gov.bc.ca/int/"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.geocoder_3929_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://data-integration-geocoder-config-admin.apps.gov.bc.ca/int/",
    "https://geocoder-config-admin-prod.apps.gov.bc.ca/int/",
    "+"
  ]
}
