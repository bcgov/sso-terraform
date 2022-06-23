data "keycloak_authentication_flow" "gdx_agreements_tracker_3833_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "gdx-agreements-tracker-3833" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "gdx-agreements-tracker-3833"
  client_name = "GDX-Agreements-tracker"
  valid_redirect_uris = [
    "https://localhost"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.gdx_agreements_tracker_3833_browserflow.id
}
