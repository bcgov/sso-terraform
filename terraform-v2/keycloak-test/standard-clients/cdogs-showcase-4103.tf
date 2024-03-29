data "keycloak_authentication_flow" "cdogs_showcase_4103_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "cdogs-showcase-4103" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "cdogs-showcase-4103"
  client_name                         = "CDOGS Showcase"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.cdogs_showcase_4103_browserflow.id
  standard_flow_enabled        = false
  service_accounts_enabled     = true
}
