module "annual-fisheries-production-schedule-5218" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "annual-fisheries-production-schedule-5218"
  client_name                         = "Annual Fisheries Production Schedule"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
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
    "https://submit.digital.gov.bc.ca/app/form/submit?f=4b6caefe-298c-4da0-8925-99c15b8c3a7f",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://submit.digital.gov.bc.ca/app/form/submit?f=4b6caefe-298c-4da0-8925-99c15b8c3a7f"
  ]
}
