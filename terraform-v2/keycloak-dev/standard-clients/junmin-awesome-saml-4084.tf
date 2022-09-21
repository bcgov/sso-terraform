data "keycloak_authentication_flow" "junmin_awesome_saml_4084_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
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
    "bceidbasic",
    "github",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.junmin_awesome_saml_4084_browserflow.id
}
