data "keycloak_authentication_flow" "performance_application_system_3942_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "performance-application-system-3942" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "performance-application-system-3942"
  client_name = "Performance ASystem"
  valid_redirect_uris = [
    "http://localhost:8000",
    "https://performance-332842-dev.apps.silver.devops.gov.bc.ca/login/keycloak/callback"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.performance_application_system_3942_browserflow.id
}
