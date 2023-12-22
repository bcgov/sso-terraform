module "ministry-of-finance-data-catalogue-4832" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "ministry-of-finance-data-catalogue-4832"
  client_name                         = "Ministry of Finance Data Catalogue Dev"
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
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://dev.cat.data.fin.gov.bc.ca/openid-connect/keycloak",
    "https://dv21.openplus.ca/openid-connect/keycloak",
    "https://mfin-data-catalogue.apps.silver.devops.gov.bc.ca/openid-connect/keycloak"
  ]
}
