data "keycloak_authentication_flow" "ministry_of_finance_intranet_3804_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "ministry-of-finance-intranet-3804" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "ministry-of-finance-intranet-3804"
  client_name = "Ministry of Finance Intranet"
  valid_redirect_uris = [
    "https://test.intranet.fin.gov.bc.ca/"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.ministry_of_finance_intranet_3804_browserflow.id
}
