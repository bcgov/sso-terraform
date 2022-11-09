module "education-common-4080" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "education-common-4080"
  client_name                         = "Education Common"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
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
    "https://soam-prod.apps.silver.devops.gov.bc.ca/auth/realms/master/broker/gold_keycloak_bcdevexchange_idir/endpoint",
    "https://soam-prod.apps.silver.devops.gov.bc.ca/auth/realms/master/broker/keycloak_bcdevexchange_bceid/endpoint",
    "https://soam-prod.apps.silver.devops.gov.bc.ca/auth/realms/master/broker/keycloak_bcdevexchange_bceid/endpoint/logout_response",
    "https://soam-prod.apps.silver.devops.gov.bc.ca/auth/realms/master/broker/keycloak_bcdevexchange_idir/endpoint",
    "https://soam-prod.apps.silver.devops.gov.bc.ca/auth/realms/master/broker/keycloak_bcdevexchange_idir/endpoint/logout_response"
  ]
}
