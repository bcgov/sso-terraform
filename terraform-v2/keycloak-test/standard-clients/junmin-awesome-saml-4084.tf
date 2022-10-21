module "junmin-awesome-saml-4084" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "junmin-awesome-saml-4084"
  client_name        = "JUNMIN AWESOME SAML"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "http://localhost:3000"
  ]
  idps = [
    "idir",
    "azureidir",
    "bceidboth",
    "github",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
