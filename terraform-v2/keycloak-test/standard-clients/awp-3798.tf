data "keycloak_authentication_flow" "awp_3798_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "awp-3798" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "awp-3798"
  client_name                         = "SAWSx"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.awp_3798_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://rft-awp.th.gov.bc.ca/*",
    "https://tst-awp.th.gov.bc.ca/*",
    "https://uat-awp.th.gov.bc.ca/*"
  ]
}
