module "tians-testing-saml-demo-4272" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "tians-testing-saml-demo-4272"
  client_name        = "Tian's Testing - SAML Demo"
  assertion_lifespan = 1080
  valid_redirect_uris = [
    "https://exampleTest"
  ]
  idps = [
    "idir",
    "azureidir",
    "github",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
