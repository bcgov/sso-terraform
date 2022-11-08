module "exit-survey-admin-4359" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "exit-survey-admin-4359"
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
  additional_role_attribute    = "exitsurveyadmin"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "*",
    "http://local-frontend-c746eb-tools.apps.silver.devops.gov.bc.ca",
    "http://localhost:3000/*",
    "http://localhost:5051/*",
    "https://localhost:5051/*",
    "https://securesurveys.gov.bc.ca/dev/Exit/admin/*",
    "https://securesurveys.gov.bc.ca/dev/exit/admin/*"
  ]
}
