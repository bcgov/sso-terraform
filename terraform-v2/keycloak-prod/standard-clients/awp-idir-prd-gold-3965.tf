data "keycloak_authentication_flow" "awp_idir_prd_gold_3965_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "awp-idir-prd-gold-3965" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "awp-idir-prd-gold-3965"
  client_name                         = "AWP-IDIR-PRD-GOLD"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.awp_idir_prd_gold_3965_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://awp.th.gov.bc.ca/*"
  ]
}
