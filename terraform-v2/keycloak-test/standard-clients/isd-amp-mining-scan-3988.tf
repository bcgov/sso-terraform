data "keycloak_authentication_flow" "isd_amp_mining_scan_3988_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "isd-amp-mining-scan-3988" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "isd-amp-mining-scan-3988"
  client_name                         = "ISD-AMP-Mining-Scan"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.isd_amp_mining_scan_3988_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://sso.apps-isd.sd.gov.bc.ca/auth/realms/mining-test/broker/keycloak-oidc/endpoint"
  ]
}
