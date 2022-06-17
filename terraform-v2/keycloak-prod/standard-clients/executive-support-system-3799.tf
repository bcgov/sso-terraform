data "keycloak_authentication_flow" "executive_support_system_3799_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "executive-support-system-3799" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "executive-support-system-3799"
  client_name = "Executive Support System"
  valid_redirect_uris = [
    "https://cabops.gov.bc.ca/"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.executive_support_system_3799_browserflow.id
}
