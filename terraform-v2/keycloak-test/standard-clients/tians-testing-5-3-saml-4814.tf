module "tians-testing-5-3-saml-4814" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "tians-testing-5-3-saml-4814"
  client_name        = "Tian's Testing 5/3 saml"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://bcgov.github.io/keycloak-example-apps/*"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = "  "
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
