data "keycloak_authentication_flow" "aps_po_c_roles_3864_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "aps-po-c-roles-3864" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "aps-po-c-roles-3864"
  client_name = "APS PoC Roles"
  valid_redirect_uris = [
    "https://aps-roles-poc-apps-gov-bc-ca.dev.api.gov.bc.ca"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.aps_po_c_roles_3864_browserflow.id
}
