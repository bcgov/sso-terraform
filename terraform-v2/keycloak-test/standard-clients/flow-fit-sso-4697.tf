module "flow-fit-sso-4697" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "flow-fit-sso-4697"
  client_name        = "FlowFit SSO"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://eductrabc.flowfitservices.com/FlowFitAPI/api/saml/AssertionConsumerServiceTMS"
  ]
  idps = [
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
