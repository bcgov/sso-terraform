module "test_client_conf" {
  source                              = "../modules/standard-client"
  realm_id                            = module.standard.realm_id
  client_id                           = "test-client-conf"
  client_name                         = "Local Dev Confidential"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
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
  standard_flow_enabled    = true
  service_accounts_enabled = false
  access_type              = "CONFIDENTIAL"
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "http://localhost:8080/*"
  ]
  web_origins                  = ["+"]
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
