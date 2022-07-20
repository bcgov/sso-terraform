data "keycloak_authentication_flow" "alcs_3944_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "alcs-3944" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "alcs-3944"
  client_name = "ALCS Development"
  valid_redirect_uris = [
    "https://alcs-dev.apps.silver.devops.gov.bc.ca"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.alcs_3944_browserflow.id
}
