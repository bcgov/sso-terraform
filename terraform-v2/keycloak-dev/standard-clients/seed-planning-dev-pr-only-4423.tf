module "seed-planning-dev-pr-only-4423" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "seed-planning-dev-pr-only-4423"
  client_name                         = "Seed Planning Dev-PR Only"
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/dashboard",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/home",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/logout",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/silent-check-sso",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/dashboard",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/home",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/logout",
    "https://nrsparwebapp-10-app.apps.silver.devops.gov.bc.ca/silent-check-sso"
  ]
}
