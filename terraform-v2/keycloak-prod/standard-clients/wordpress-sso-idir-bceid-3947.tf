data "keycloak_authentication_flow" "wordpress_sso_idir_bceid_3947_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "wordpress-sso-idir-bceid-3947" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "wordpress-sso-idir-bceid-3947"
  client_name = "wordpress-sso-idir-bceid"
  valid_redirect_uris = [
    "https://feedbcdirectory.gov.bc.ca/*"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidboth",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.wordpress_sso_idir_bceid_3947_browserflow.id
}
