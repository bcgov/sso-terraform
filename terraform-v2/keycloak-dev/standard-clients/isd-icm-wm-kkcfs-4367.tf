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
    "https://icmint620b-cysndevds.api.gov.bc.ca/*",
    "https://icmint621b-cysndevds.api.gov.bc.ca/*",
    "https://icmint678-cysndevds.api.gov.bc.ca/*",
    "https://kkcfs-wm-diona.api.gov.bc.ca/*",
    "https://kkcfs-wm.api.gov.bc.ca/*"
  ]
}
