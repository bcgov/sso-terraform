module "url-shortener-5087" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "url-shortener-5087"
  client_name                         = "URL Shortener"
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
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://localhost:3000",
    "http://localhost:3000/",
    "http://localhost:3000/*",
    "http://localhost:8080/*",
    "https://gdx-analytics-url-shortener-c6d33e-dev.apps.silver.devops.gov.bc.ca"
  ]
}
