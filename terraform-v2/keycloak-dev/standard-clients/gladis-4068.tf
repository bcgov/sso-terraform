data "keycloak_authentication_flow" "gladis_4068_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "gladis-4068" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "gladis-4068"
  client_name                         = "GLADIS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.gladis_4068_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://home.urbanlogiq.ca",
    "https://urbanlogiqcanada.b2clogin.com/urbanlogiqcanada.onmicrosoft.com/*"
  ]
}
