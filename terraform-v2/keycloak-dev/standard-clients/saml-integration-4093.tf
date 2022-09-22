data "keycloak_authentication_flow" "saml_integration_4093_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "saml-integration-4093" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "saml-integration-4093"
  client_name        = "SAML Integration"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "*",
    "https://example.com"
  ]
  idps = [
    "idir",
    "github",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.saml_integration_4093_browserflow.id
}
