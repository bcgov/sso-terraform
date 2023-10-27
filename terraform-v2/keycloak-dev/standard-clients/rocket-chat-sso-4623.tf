module "rocket-chat-sso-4623" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "rocket-chat-sso-4623"
  client_name                         = "BC Gov Rocket.Chat Login - DEV"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "azureidir",
    "githubbcgov",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  login_theme                  = "bcgov-idp-stopper-no-header-title"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "http://chat-dev.developer.gov.bc.ca/",
    "https://dev-chat.apps.gold.devops.gov.bc.ca/_oauth/keycloakgold",
    "https://dev-chat.apps.golddr.devops.gov.bc.ca/_oauth/keycloakgold"
  ]
}
