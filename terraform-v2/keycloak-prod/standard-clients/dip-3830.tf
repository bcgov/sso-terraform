data "keycloak_authentication_flow" "dip_3830_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "dip-3830" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "dip-3830"
  client_name = "dip"
  valid_redirect_uris = [
    "https://dip-authz.apps.gov.bc.ca/auth/realms/prod/broker/gov/endpoint"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.dip_3830_browserflow.id
}
