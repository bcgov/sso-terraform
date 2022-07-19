data "keycloak_authentication_flow" "jon_confidential_examp_3941_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "jon-confidential-examp-3941" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "jon-confidential-examp-3941"
  client_name = "Jon Confidential Examp"
  valid_redirect_uris = [
    "http://localhost:3000/oauth/cognito"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.jon_confidential_examp_3941_browserflow.id
}
