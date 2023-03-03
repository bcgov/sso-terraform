module "test-saml-client-nk-4658" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "test-saml-client-nk-4658"
  client_name        = "test-saml-client-nk"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://*"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
