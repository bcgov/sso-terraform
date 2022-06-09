data "keycloak_authentication_flow" "june_2_zorin_test_domain_json_file_3734_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "june-2-zorin-test-domain-json-file-3734" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "june-2-zorin-test-domain-json-file-3734"
  client_name = "June 2 zorin test domain json file"
  valid_redirect_uris = [
    "http://localhost:3000/",
    "http://localhost:3000/*",
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
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
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.june_2_zorin_test_domain_json_file_3734_browserflow.id
}
