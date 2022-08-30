data "keycloak_authentication_flow" "new_job_survey_admin_4074_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "new-job-survey-admin-4074" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "new-job-survey-admin-4074"
  client_name                         = "NewJobSurveyAdmin"
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.new_job_survey_admin_4074_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "https://localhost:3000/*",
    "https://localhost:5051/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://localhost:3000/*",
    "https://localhost:5051/*"
  ]
}
