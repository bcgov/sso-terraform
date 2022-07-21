data "keycloak_authentication_flow" "wordpress_sso_idir_3946_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "wordpress-sso-idir-3946" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "wordpress-sso-idir-3946"
  client_name = "wordpress-sso-idir"
  valid_redirect_uris = [
    "https://cloud-test.apps.silver.devops.gov.bc.ca/*",
    "https://cloud.gov.bc.ca/*",
    "https://platform-services-dev.apps.silver.devops.gov.bc.ca/*"
  ]
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
  browser_authentication_flow  = data.keycloak_authentication_flow.wordpress_sso_idir_3946_browserflow.id
}
