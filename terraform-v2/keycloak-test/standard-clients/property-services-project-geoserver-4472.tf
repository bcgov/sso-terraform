module "property-services-project-geoserver-4472" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "property-services-project-geoserver-4472"
  client_name                         = "Property Services Project(Geoserver)"
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
  additional_role_attribute    = "roles"
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://vip-tst-geo.th.gov.bc.ca:8082/ogs-geoV06/psp_uat/ows*",
    "https://test.loginproxy.gov.bc.ca/auth/admin/standard/keycloak-oidc/endpoint*"
  ]
}
