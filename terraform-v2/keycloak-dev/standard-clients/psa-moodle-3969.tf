data "keycloak_authentication_flow" "psa_moodle_3969_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "psa-moodle-3969" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "psa-moodle-3969"
  client_name                         = "PSA Moodle DEV"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.psa_moodle_3969_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://moodle-950003-dev.apps.silver.devops.gov.bc.ca/admin/oauth2callback.php",
    "https://moodle.virtuallearn.ca/admin/oauth2callback.php"
  ]
}
