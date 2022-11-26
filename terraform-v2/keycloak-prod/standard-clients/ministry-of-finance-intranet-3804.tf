module "ministry-of-finance-intranet-3804" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "ministry-of-finance-intranet-3804"
  client_name                         = "Ministry of Finance Intranet"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://fin-intra-app-route-a1a681-prod.apps.silver.devops.gov.bc.ca/",
    "https://fin-intra-app-route-a1a681-prod.apps.silver.devops.gov.bc.ca/*",
    "https://fin-intra-app-route-a1a681-prod.apps.silver.devops.gov.bc.ca/openid-connect/keycloak",
    "https://intranet.fin.gov.bc.ca/",
    "https://intranet.fin.gov.bc.ca/*",
    "https://intranet.fin.gov.bc.ca/openid-connect/keycloak"
  ]
}
