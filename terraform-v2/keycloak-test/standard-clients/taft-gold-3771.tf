data "keycloak_authentication_flow" "taft_gold_3771_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "taft-gold-3771" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "taft-gold-3771"
  client_name = "TAFT-GOLD"
  valid_redirect_uris = [
    "https://idm-test-taft.apps.silver.devops.gov.bc.ca/auth/realms/taft/broker/idir/endpoint"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.taft_gold_3771_browserflow.id
}
