module "office-of-the-superintendent-of-prof-governance-4298" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "office-of-the-superintendent-of-prof-governance-4298"
  client_name                         = "Office of the Superintendent of Prof Governance"
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
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://keycloak-e63731-test.apps.silver.devops.gov.bc.ca/auth/realms/forms-flow-ai/broker/keycloak-oidc-gold/endpoint",
    "https://pgpot-user-test.ospg.psfs.gov.bc.ca/auth/realms/forms-flow-ai/broker/keycloak-oidc-gold/endpoint"
  ]
}
