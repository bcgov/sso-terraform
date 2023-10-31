module "gdx-browserstack-5012" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "https://login.browserstack.com/auth/realms/6d0c9eb9d7c86a9e0258b275b467c4f3"
  client_name        = "GDX Browserstack"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://login.browserstack.com/auth/realms/6d0c9eb9d7c86a9e0258b275b467c4f3/broker/f5f6d13d51a9bb64426cbcf69b380c17/endpoint"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = "https://www.browserstack.com/"
  sign_assertions              = true
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
