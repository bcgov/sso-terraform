data "keycloak_authentication_flow" "elmsd_back_end_dev_4125_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "elmsd-back-end-dev-4125" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "elmsd-back-end-dev-4125"
  client_name                         = "ELMSD Back End Dev"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.elmsd_back_end_dev_4125_browserflow.id
  standard_flow_enabled        = false
  service_accounts_enabled     = true
}
