module "virtual-home-energy-rating-system-4932" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "virtual-home-energy-rating-system-4932"
  client_name                         = "Virtual Home Energy Rating System"
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
  login_theme                  = "bcgov-idp-stopper-no-header-title"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "https://bc-emli-pin-mgmt-prod-be.apps.silver.devops.gov.bc.ca/oauth",
    "https://bc-emli-pin-mgmt-prod-be.apps.silver.devops.gov.bc.ca/oauth/logout",
    "https://cleanbc.gov.bc.ca/"
  ]
}
