module "june-2-idir-only-testing-3730" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "june-2-idir-only-testing-3730"
  client_name                         = "June 2 IDIR Only Testing"
  access_token_lifespan               = 600
  client_session_idle_timeout         = 600
  client_session_max_lifespan         = 600
  client_offline_session_idle_timeout = 600
  client_offline_session_max_lifespan = 600
  idps = [
    "idir",
    "azureidir",
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
    "http://localhost:3000",
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://dev.loginproxy.gov.bc.ca/auth/realms/sso-team-testing/*"
  ]
}
