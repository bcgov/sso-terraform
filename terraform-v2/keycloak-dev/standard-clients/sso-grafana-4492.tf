module "sso-grafana-4492" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "sso-grafana-4492"
  client_name                         = "SSO Dashboard"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
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
    "http://sso-grafana-sandbox.apps.gold.devops.gov.bc.ca/*",
    "https://sso-grafana-sandbox.apps.gold.devops.gov.bc.ca/*",
    "https://sso-minio-sandbox.apps.gold.devops.gov.bc.ca/*",
    "https://uzw525hsr2.execute-api.ca-central-1.amazonaws.com/*"
  ]
}
