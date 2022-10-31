module "my-css-ccof-idir-4324" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "my-css-ccof-idir-4324"
  client_name                         = "MyCSS-CCOF-IDIR"
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
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "https://test.mychildcareservices.gov.bc.ca/api/auth/callback",
    "https://test.mychildcareservices.gov.bc.ca/api/auth/callback_bceid",
    "https://test.mychildcareservices.gov.bc.ca/api/auth/callback_idir"
  ]
}
