data "keycloak_authentication_flow" "mmia_service_account_3994_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "mmia-service-account-3994" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "mmia-service-account-3994"
  client_name                         = "MMIA"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.mmia_service_account_3994_browserflow.id
  standard_flow_enabled        = false
  service_accounts_enabled     = true
}
