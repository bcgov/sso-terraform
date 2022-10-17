module "aps-portal-4138" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "aps-portal-4138"
  client_name                         = "APS Portal DEV"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "azureidir",
    "bceidbusiness",
    "github",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:4180/oauth2/callback",
    "https://authz-apps-gov-bc-ca.dev.api.gov.bc.ca/auth/realms/aps-v2/broker/sso-gold/endpoint",
    "https://authz-apps-gov-bc-ca.dev.api.gov.bc.ca/auth/realms/aps/broker/bceid-business/endpoint",
    "https://authz-apps-gov-bc-ca.dev.api.gov.bc.ca/auth/realms/aps/broker/github/endpoint",
    "https://authz-apps-gov-bc-ca.dev.api.gov.bc.ca/auth/realms/aps/broker/idir/endpoint"
  ]
}
