module "alcs-3944" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "alcs-3944"
  client_name                         = "ALCS"
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
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://alcs-prod-api.apps.silver.devops.gov.bc.ca/authorize",
    "https://alcs-prod.apps.silver.devops.gov.bc.ca",
    "https://alcs.nr.gov.bc.ca/",
    "https://alcs.nr.gov.bc.ca/api/authorize"
  ]
}
