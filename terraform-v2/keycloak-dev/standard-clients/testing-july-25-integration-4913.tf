module "testing-july-25-integration-4913" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "testing-july-25-integration-4913"
  client_name                         = "Testing PO Q"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = "June 29 352 PM"
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/"
  ]
}
