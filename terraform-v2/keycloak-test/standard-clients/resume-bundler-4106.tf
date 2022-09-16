data "keycloak_authentication_flow" "resume_bundler_4106_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "resume-bundler-4106" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "resume-bundler-4106"
  client_name                         = "Resume Bundler - TEST"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.resume_bundler_4106_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "https://resume-bundler-test.es.workbc.ca/*"
  ]
}
