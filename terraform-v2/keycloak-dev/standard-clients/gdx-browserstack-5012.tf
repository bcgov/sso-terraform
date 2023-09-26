module "gdx-browserstack-5012" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "gdx-browserstack-5012"
  client_name        = "GDX Browserstack - DEV"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://live.browserstack.com/*",
    "https://test.alpha.qa.gov.bc.ca/*",
    "https://www.browserstack.com/*"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = "https://www.browserstack.com/"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
