module "aps-po-c-roles-3864" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aps-po-c-roles-3864"
  client_name                         = "APS PoC Roleshello-py-api-api-gov-bc-ca.dev.api.gov.bc.ca"
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
    "https://*",
    "https://hello-py-api-api-gov-bc-ca.dev.api.gov.bc.ca/cb",
    "https://test-oidc-dev-api-gov-bc-ca.dev.api.gov.bc.ca/awstats.pl",
    "https://test-oidc-dev-api-gov-bc-ca.dev.api.gov.bc.ca/awstats/awstats.pl",
    "https://test-oidc-dev-api-gov-bc-ca.dev.api.gov.bc.ca/subfolder/"
  ]
}
