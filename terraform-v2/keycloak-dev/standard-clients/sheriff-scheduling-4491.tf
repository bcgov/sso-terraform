module "sheriff-scheduling-4491" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sheriff-scheduling-4491"
  client_name                         = "Sheriff Scheduling"
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
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://dev.jag.gov.bc.ca/sheriff-scheduling/*",
    "https://localhost:1338/*",
    "https://localhost:44370/*",
    "https://localhost:5000/*",
    "https://localhost:5001/*",
    "https://localhost:8080/*",
    "https://localhost:8081/*",
    "https://sheriff-scheduling-dev.apps.silver.devops.gov.bc.ca/*",
    "https://sheriff-scheduling-dev.pathfinder.gov.bc.ca/*"
  ]
}
