module "sabc-applications-ici-4522" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sabc-applications-ici-4522"
  client_name                         = "SABC Applications - ICI"
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
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://10.0.0.51:3333/applogin",
    "http://127.0.0.1:3333/applogin",
    "https://tbtb-ici-06cb9b-dev.apps.silver.devops.gov.bc.ca/applogin"
  ]
}
