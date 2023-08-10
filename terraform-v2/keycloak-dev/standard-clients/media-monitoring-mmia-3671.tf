module "media-monitoring-mmia-3671" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "media-monitoring-mmia-3671"
  client_name                         = "Media Monitoring Insight & Analysis"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
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
    "http://localhost:40080/*",
    "https:///dev.mmia.gov.bc.ca/*",
    "https://dev.editor.mmia.gov.bc.ca/*",
    "https://mmia-dev-0.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev-1.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev-2.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-0.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-1.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-2.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:40080/*",
    "https:///dev.mmia.gov.bc.ca/*",
    "https://dev.editor.mmia.gov.bc.ca/*",
    "https://mmia-dev-0.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev-1.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev-2.apps.silver.devops.gov.bc.ca/*",
    "https://mmia-dev.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-0.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-1.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev-2.apps.silver.devops.gov.bc.ca/*",
    "https://tno-dev.apps.silver.devops.gov.bc.ca/*"
  ]
}
