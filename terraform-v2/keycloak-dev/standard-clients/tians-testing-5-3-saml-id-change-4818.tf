module "tians-testing-5-3-saml-id-change-4818" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "Tian-SAML-5-3-update"
  client_name        = "Tian's Testing 5/3 SAML ID Change"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "http://localhost:8080/*"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = "http://localhost:8080/logout/callback"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
