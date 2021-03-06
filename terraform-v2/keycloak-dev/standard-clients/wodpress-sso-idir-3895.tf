data "keycloak_authentication_flow" "wodpress_sso_idir_3895_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "wodpress-sso-idir-3895" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "wodpress-sso-idir-3895"
  client_name = "wodpress-sso-idir"
  valid_redirect_uris = [
    "https://cloud-test.apps.silver.devops.gov.bc.ca/*"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.wodpress_sso_idir_3895_browserflow.id
}
