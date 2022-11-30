module "aest-sims-4424" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aest-sims-4424"
  client_name                         = "AEST-SIMS"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "https://dev-aest-sims.apps.silver.devops.gov.bc.ca/*",
    "https://dev.loginproxy.gov.bc.ca/auth/realms/aestsims/*"
  ]
}
