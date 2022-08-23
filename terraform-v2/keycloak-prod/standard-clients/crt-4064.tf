data "keycloak_authentication_flow" "crt_4064_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "crt-4064" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "crt-4064"
  client_name                         = "CRT"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.crt_4064_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "https://crt.th.gov.bc.ca/",
    "https://crt.th.gov.bc.ca/*"
  ]
}
