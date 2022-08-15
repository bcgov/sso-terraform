data "keycloak_authentication_flow" "abcd_1_test_3992_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "abcd-1-test-3992" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "abcd-1-test-3992"
  client_name                         = "ABCD1 test"
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
  browser_authentication_flow  = data.keycloak_authentication_flow.abcd_1_test_3992_browserflow.id
  standard_flow_enabled        = true
  service_accounts_enabled     = true
  valid_redirect_uris = [
    "htttps://abctest.com"
  ]
}
