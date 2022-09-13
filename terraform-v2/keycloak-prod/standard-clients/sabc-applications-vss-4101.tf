data "keycloak_authentication_flow" "sabc_applications_vss_4101_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sabc-applications-vss-4101" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sabc-applications-vss-4101"
  client_name                         = "SABC Applications - VSS"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.sabc_applications_vss_4101_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "http://10.0.0.51:8017/app-login",
    "https://tbtb-vss-06cb9b-prod.apps.silver.devops.gov.bc.ca/sso-login"
  ]
}
