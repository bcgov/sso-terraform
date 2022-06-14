data "keycloak_authentication_flow" "epicflow_3764_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "epicflow-3764" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "epicflow-3764"
  client_name = "EPICFLOW"
  valid_redirect_uris = [
    "https://forms-flow-web-dc383e-dev.apps.silver.devops.gov.bc.ca"
  ]
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.epicflow_3764_browserflow.id
}
