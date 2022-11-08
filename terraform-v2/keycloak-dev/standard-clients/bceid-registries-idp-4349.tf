module "bceid-registries-idp-4349" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "bceid-registries-idp-4349"
  client_name                         = "bceid-registries-idp"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://bc-registry-namerequest-sre-3b2420-tools.apps.silver.devops.gov.bc.ca/namerequest/*",
    "https://dev.loginproxy.gov.bc.ca/auth/realms/bcregistry/*"
  ]
}
