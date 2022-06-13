data "keycloak_authentication_flow" "sdpr_research_portal_3770_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sdpr-research-portal-3770" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "sdpr-research-portal-3770"
  client_name = "SDPR Research Branch"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://research-portal-ba7244-dev.apps.silver.devops.gov.bc.ca/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.sdpr_research_portal_3770_browserflow.id
}
