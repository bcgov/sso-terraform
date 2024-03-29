module "digital-privacy-impact-assessment-modernization-3937" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "digital-privacy-impact-assessment-modernization-3937"
  client_name                         = "Digital Privacy Impact Assessment Modernization"
  access_token_lifespan               = 3600
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
    "http://localhost:3500/*",
    "http://localhost:3600/*",
    "http://localhost:8080/*",
    "https://dev-pia.apps.emerald.devops.gov.bc.ca/*",
    "https://dev.pia.gov.bc.ca/*"
  ]
}
