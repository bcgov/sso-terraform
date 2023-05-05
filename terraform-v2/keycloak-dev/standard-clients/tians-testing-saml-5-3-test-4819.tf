module "tians-testing-saml-5-3-test-4819" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "tians-testing-saml-5-3-test-4819"
  client_name        = "Tian's Testing - SAML 5/3 test"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://example"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = "abc"
  logout_post_binding_url      = "http://localhost:8080/logout/callback"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}