module "zeva-on-gold-4543" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "zeva-on-gold-4543"
  client_name                         = "ZEVA Dev on Gold"
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
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://logontest7.gov.bc.ca/*",
    "https://zeva-dev-1609.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1646.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1767.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1786.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1839.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://logontest7.gov.bc.ca/*",
    "https://zeva-dev-1609.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1646.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1767.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1786.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev-1839.apps.silver.devops.gov.bc.ca/*",
    "https://zeva-dev.apps.silver.devops.gov.bc.ca/*"
  ]
}
