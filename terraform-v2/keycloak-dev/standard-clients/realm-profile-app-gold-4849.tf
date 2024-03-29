module "realm-profile-app-gold-4849" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "realm-profile-app-gold-4849"
  client_name                         = "realm-profile-app-gold"
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
    "http://localhost:3000/*",
    "http://localhost:8000/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8089/*",
    "http://realm-registry-c6af30-dev.apps.gold.devops.gov.bc.ca/*",
    "http://realm-registry-sandbox.apps.gold.devops.gov.bc.ca/*",
    "http://realm-registry.apps.gold.devops.gov.bc.ca/*",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
}
