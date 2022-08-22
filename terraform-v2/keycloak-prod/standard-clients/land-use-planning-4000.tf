data "keycloak_authentication_flow" "land_use_planning_4000_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "land-use-planning-4000" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "land-use-planning-4000"
  client_name                         = "Land Use Planning"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.land_use_planning_4000_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "https://landuseplanning.gov.bc.ca/admin/"
  ]
}
