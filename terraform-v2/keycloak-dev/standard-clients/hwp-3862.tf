data "keycloak_authentication_flow" "hwp_3862_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "hwp-3862" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "hwp-3862"
  client_name = "hwp-login"
  valid_redirect_uris = [
    "http://localhost:8080"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.hwp_3862_browserflow.id
}
