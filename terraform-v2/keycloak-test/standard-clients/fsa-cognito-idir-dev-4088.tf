module "fsa-cognito-idir-dev-4088" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "fsa-cognito-idir-dev-4088"
  client_name                         = "FSA Cognito IDIR DEV"
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://localhost:8080",
    "https://oidcdebuggersecure-3d5c3f-dev.apps.silver.devops.gov.bc.ca/",
    "https://test-fam-user-pool-domain.auth.ca-central-1.amazoncognito.com/oauth2/idpresponse"
  ]
}
