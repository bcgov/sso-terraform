module "pnp-provincial-nominee-program-4062" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "pnp-provincial-nominee-program-4062"
  client_name                         = "PNP - Provincial Nominee Program"
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:8000/auth/cb/keycloak/",
    "https://dev-assessment.pnpapplication.gov.bc.ca/auth/oauth-callback",
    "https://dev2-assessment.pnpapplication.gov.bc.ca/auth/oauth-callback",
    "https://uniques_phase6/auth/oauth-callback",
    "https://uniques_phase6/auth/oauth-callback/"
  ]
}
