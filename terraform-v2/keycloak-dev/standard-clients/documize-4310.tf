module "documize-4310" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "documize-4310"
  client_name                         = "documize"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "githubbcgov",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://dds-authz-dev.apps.gov.bc.ca/realms/main/broker/oidc/endpoint",
    "https://dds-authz-dev.apps.gov.bc.ca/realms/master/broker/oidc/endpoint",
    "https://dds-authz.apps.gov.bc.ca/realms/main/broker/oidc/endpoint",
    "https://dev-documize.data.gov.bc.ca/*",
    "https://documize.data.gov.bc.ca/*"
  ]
}
