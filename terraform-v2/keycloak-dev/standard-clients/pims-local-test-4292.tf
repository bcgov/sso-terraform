module "pims-local-test-4292" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "pims-local-test-4292"
  client_name                         = "PIMS-Local-Test"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/",
    "http://localhost:3000/",
    "http://localhost:3000/admin/access/requests",
    "http://localhost:3000/admin/administrativeAreas",
    "http://localhost:3000/admin/agencies",
    "http://localhost:3000/admin/users",
    "http://localhost:3000/dispose/projects/draft",
    "http://localhost:3000/login",
    "http://localhost:3000/projects/approval/requests",
    "http://localhost:3000/projects/list",
    "http://localhost:3000/projects/spl",
    "http://localhost:3000/properties/list",
    "http://localhost:3000/reports/spl",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/",
    "http://localhost:3000/",
    "http://localhost:3000/admin/access/requests",
    "http://localhost:3000/admin/administrativeAreas",
    "http://localhost:3000/admin/agencies",
    "http://localhost:3000/admin/users",
    "http://localhost:3000/dispose/projects/draft",
    "http://localhost:3000/login",
    "http://localhost:3000/projects/approval/requests",
    "http://localhost:3000/projects/list",
    "http://localhost:3000/projects/spl",
    "http://localhost:3000/properties/list",
    "http://localhost:3000/reports/spl"
  ]
}
