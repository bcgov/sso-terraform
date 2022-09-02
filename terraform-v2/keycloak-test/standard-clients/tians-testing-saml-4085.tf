data "keycloak_authentication_flow" "tians_testing_saml_4085_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "tians-testing-saml-4085" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "tians-testing-saml-4085"
  client_name        = "Tian's Testing - SAML"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://exampleTest"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.tians_testing_saml_4085_browserflow.id
}
