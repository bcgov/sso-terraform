data "keycloak_authentication_flow" "wildlife_health_information_system_3767_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "wildlife-health-information-system-3767" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "wildlife-health-information-system-3767"
  client_name = "Wildlife Health Information System"
  valid_redirect_uris = [
    "https://whis-ui-dev.apps.silver.devops.gov.bc.ca/"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.wildlife_health_information_system_3767_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://whis-ui-dev.apps.silver.devops.gov.bc.ca/",
    "+"
  ]
}
