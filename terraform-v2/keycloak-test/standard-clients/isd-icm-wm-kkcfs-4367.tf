module "isd-icm-wm-kkcfs-4367" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "isd-icm-wm-kkcfs-4367"
  client_name                         = "ICM-Integrations"
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
  login_theme                  = "bcgov-idp-stopper-no-header-title"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "comdionavisits://auth/callback",
    "https://icmint620b-sitds.api.gov.bc.ca/*",
    "https://icmint620b-sitps.api.gov.bc.ca/*",
    "https://icmint621b-sitds.api.gov.bc.ca/*",
    "https://icmint621b-sitps.api.gov.bc.ca/*",
    "https://icmint678-sitds.api.gov.bc.ca/*",
    "https://icmint678-sitps.api.gov.bc.ca/*",
    "https://icmint679-sitds.api.gov.bc.ca/*",
    "https://icmint679-sitps.api.gov.bc.ca/*",
    "https://icmint680-sitds.api.gov.bc.ca/*",
    "https://icmint680-sitps.api.gov.bc.ca/*"
  ]
}
