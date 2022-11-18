module "isd-sonar-qube-4393" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "isd-sonar-qube-4393"
  client_name                         = "ISD-SonarQube"
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
    "https://git.apps-isd.sd.gov.bc.ca/user/oauth2/oidc/callback",
    "https://sonarqube.apps-isd.sd.gov.bc.ca/oauth2/callback/oidc"
  ]
}
