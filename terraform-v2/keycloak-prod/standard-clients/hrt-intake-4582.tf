module "hrt-intake-4582" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "hrt-intake-4582"
  client_name                         = "HRT Intake"
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
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://intake.bchrt.bc.ca/api/v1/oidc/auth/cb/",
    "https://intake.bchrt.bc.ca/hrt/hrt",
    "https://intake.bchrt.bc.ca/hrt/hrt-group",
    "https://intake.bchrt.bc.ca/hrt/hrt-retaliation"
  ]
}
