module "seed-planning-test-4296" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "seed-planning-test-4296"
  client_name                         = "Seed Planning Test - Test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/dashboard",
    "http://localhost:3000/logout",
    "http://localhost:3000/silent-check-sso",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/dashboard",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/logout",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/silent-check-sso",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/dashboard",
    "http://localhost:3000/logout",
    "http://localhost:3000/silent-check-sso",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/dashboard",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/logout",
    "https://nrsparwebapp-test-app.apps.silver.devops.gov.bc.ca/silent-check-sso"
  ]
}
