data "keycloak_authentication_flow" "ches_showcase_4104_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "ches-showcase-4104" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "ches-showcase-4104"
  client_name                         = "CHES SHowcase"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.ches_showcase_4104_browserflow.id
  standard_flow_enabled        = false
  service_accounts_enabled     = true
}
