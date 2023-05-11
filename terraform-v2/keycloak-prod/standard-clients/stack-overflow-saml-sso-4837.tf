module "stack-overflow-saml-sso-4837" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "stack-overflow-saml-sso-4837"
  client_name        = "BC Gov Stack Overflow"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://stackoverflow.developer.gov.bc.ca/auth/saml2/post"
  ]
  idps = [
    "githubbcgov",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
