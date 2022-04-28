data "keycloak_authentication_flow" "test_project_3645_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "test-project-3645" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_name = "test-project-3645"
  valid_redirect_uris = [
    "https://test-project"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.test_project_3645_browserflow.id
}
