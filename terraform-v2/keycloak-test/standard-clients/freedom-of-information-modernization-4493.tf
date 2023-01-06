module "freedom-of-information-modernization-4493" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "freedom-of-information-modernization-4493"
  client_name                         = "Freedom of Information modernization"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "githubbcgov",
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
    "https://test.loginproxy.gov.bc.ca/auth/realms/foi-mod/broker/github/endpoint",
    "https://test.loginproxy.gov.bc.ca/auth/realms/foi-mod/broker/github/endpoint/logout_response",
    "https://test.loginproxy.gov.bc.ca/auth/realms/foi-mod/broker/idir/endpoint",
    "https://test.loginproxy.gov.bc.ca/auth/realms/foi-mod/broker/idir/endpoint/logout_response",
    "https://test.loginproxy.gov.bc.ca/auth/realms/standard/protocol/openid-connect/logout"
  ]
}
