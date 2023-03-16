module "july-28-b-ce-id-b-usiness-dev-3940" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "july-28-b-ce-id-b-usiness-dev-3940"
  client_name                         = "test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:3000/api/auth/callback/keycloak",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://dev.loginproxy.gov.bc.ca/auth/realms/zorin_test_realm_march15/*"
  ]
}
