module "exit-survey-admin-4373" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "exit-survey-admin-4373"
  client_name                         = "ExitSurveyAdmin"
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
  additional_role_attribute    = "user_roles"
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "*",
    "http://local-frontend-c746eb-tools.apps.silver.devops.gov.bc.ca",
    "http://localhost:3000/*",
    "http://localhost:5051/*",
    "https://securesurveys.gov.bc.ca/dev/Exit/admin/*",
    "https://securesurveys.gov.bc.ca/dev/exit/admin/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "*",
    "http://local-frontend-c746eb-tools.apps.silver.devops.gov.bc.ca",
    "http://localhost:3000/*",
    "http://localhost:5051/*",
    "https://securesurveys.gov.bc.ca/dev/Exit/admin/*",
    "https://securesurveys.gov.bc.ca/dev/exit/admin/*"
  ]
}
