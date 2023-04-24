module "cvcom-dev-4803" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "cvcom-dev-4803"
  client_name                         = "CVCOM-DEV"
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
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://dev-cvcom-proxied.th.gov.bc.ca/",
    "https://dev-cvcom-proxied.th.gov.bc.ca/*",
    "https://dev-cvcom.th.gov.bc.ca/",
    "https://dev-cvcom.th.gov.bc.ca/*",
    "https://localhost:44328/",
    "https://localhost:44328/*"
  ]
}
