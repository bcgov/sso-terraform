data "keycloak_authentication_flow" "saml_test_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "saml-test" {
  source             = "../../modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "saml-test"
  idps               = ["common", "idir", "bceidbasic", "githubbcgov"]
  assertion_lifespan = "120"

  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.saml_test_browserflow.id
  valid_redirect_uris = [
    "http://localhost:8080/*"
  ]
  logout_post_binding_url = "http://localhost:8080/logout/callback"
}
