data "keycloak_authentication_flow" "software_as_a_service_saa_s_website_4079_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "software-as-a-service-saa-s-website-4079" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "software-as-a-service-saa-s-website-4079"
  client_name                         = "Software as a Service (SaaS) website"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.software_as_a_service_saa_s_website_4079_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://cloud.gov.bc.ca/saas/"
  ]
}
