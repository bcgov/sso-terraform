module "chefs-data-ingestion-ministry-of-health-4712" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "chefs-data-ingestion-ministry-of-health-4712"
  client_name                         = "CHEFS MEDIS Prod"
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
    "https://keycloak-c2da03-prod.apps.silver.devops.gov.bc.ca/*",
    "https://loginproxy.gov.bc.ca/auth/realms/standard/*",
    "https://medis-chefs-prod.apps.silver.devops.gov.bc.ca/*"
  ]
}
