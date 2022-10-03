data "keycloak_authentication_flow" "idp_stopper" {
  realm_id = module.standard.realm_id
  alias    = "idp stopper"
}

module "test-client" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = module.standard.realm_id
  client_id   = "test-client"
  client_name = "SSO Gold Dev"
  idps = [
    "common",
    "idir",
    "azureidir",
    "bceidbasic",
    "bceidbusiness",
    "bceidboth",
    "github",
  ]
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*"
  ]
}
