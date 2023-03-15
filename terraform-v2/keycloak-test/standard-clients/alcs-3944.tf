module "alcs-3944" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "alcs-3944"
  client_name                         = "ALCS Test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
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
    "http://localhost:4200/*",
    "http://localhost:4201/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8083/*",
    "https://alcs-dev-api.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-dev-portal-api.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-dev-portal.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-dev.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-test-api.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-test-portal-api.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-test-portal.apps.silver.devops.gov.bc.ca/*",
    "https://alcs-test.apps.silver.devops.gov.bc.ca"
  ]
}
