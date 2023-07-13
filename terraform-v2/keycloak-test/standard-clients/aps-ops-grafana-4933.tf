module "aps-ops-grafana-4933" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aps-ops-grafana-4933"
  client_name                         = "APS Ops Grafana"
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
    "https://ops-grafana-test-b8840c-test.apps.gold.devops.gov.bc.ca/login/generic_oauth",
    "https://ops-grafana-test-b8840c-test.apps.golddr.devops.gov.bc.ca/login/generic_oauth"
  ]
}
