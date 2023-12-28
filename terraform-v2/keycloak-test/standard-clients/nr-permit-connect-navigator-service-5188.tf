module "nr-permit-connect-navigator-service-5188" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "nr-permit-connect-navigator-service-5188"
  client_name                         = "NR PermitConnect Navigator Service"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
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
    "https://pcns-test-master.apps.silver.devops.gov.bc.ca/oidc/callback",
    "https://pcns-test-master.apps.silver.devops.gov.bc.ca/oidc/logout",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://pcns-test-master.apps.silver.devops.gov.bc.ca/oidc/callback",
    "https://pcns-test-master.apps.silver.devops.gov.bc.ca/oidc/logout"
  ]
}
