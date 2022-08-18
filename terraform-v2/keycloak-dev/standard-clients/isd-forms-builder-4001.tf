data "keycloak_authentication_flow" "isd_forms_builder_4001_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "isd-forms-builder-4001" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "isd-forms-builder-4001"
  client_name                         = "ISDFormsBuilder"
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.isd_forms_builder_4001_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://obdev.apps.silver.devops.gov.bc.ca/oauth2/callback"
  ]
}
