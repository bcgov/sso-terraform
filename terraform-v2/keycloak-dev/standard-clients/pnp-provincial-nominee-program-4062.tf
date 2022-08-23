data "keycloak_authentication_flow" "pnp_provincial_nominee_program_4062_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "pnp-provincial-nominee-program-4062" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "pnp-provincial-nominee-program-4062"
  client_name                         = "PNP - Provincial Nominee Program"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.pnp_provincial_nominee_program_4062_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:8000/auth/cb/bcgov+idir/"
  ]
}
