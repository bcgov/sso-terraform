data "keycloak_authentication_flow" "idp_stopper" {
  realm_id = module.standard.realm_id
  alias    = "idp stopper"
}

module "test_client" {
  source      = "../modules/standard-client"
  realm_id    = module.standard.realm_id
  client_id   = "test-client"
  client_name = "Local Dev"
  idps = [
    "common",
    "idir",
    "azureidir",
    "bceidbasic",
    "bceidbusiness",
    "bceidboth",
    "githubpublic",
    "githubbcgov",
  ]
  standard_flow_enabled      = true
  service_accounts_enabled   = false
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*"
  ]
  web_origins                  = ["+"]
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
