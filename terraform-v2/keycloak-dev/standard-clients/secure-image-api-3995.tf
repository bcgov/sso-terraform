data "keycloak_authentication_flow" "secure_image_api_3995_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "secure-image-api-3995" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "secure-image-api-3995"
  client_name                         = "Secure Image"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.secure_image_api_3995_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://dev-secure-image.apps.silver.devops.gov.bc.ca/v1/auth/callback"
  ]
}
