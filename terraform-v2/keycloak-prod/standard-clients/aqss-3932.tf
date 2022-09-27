module "aqss-3932" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aqss-3932"
  client_name                         = "AQSS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://aqss.nrs.gov.bc.ca/*",
    "http://aqss.nrs.gov.bc.ca/post/*",
    "https://aqss.nrs.gov.bc.ca/*",
    "https://aqss.nrs.gov.bc.ca/post/*"
  ]
}
