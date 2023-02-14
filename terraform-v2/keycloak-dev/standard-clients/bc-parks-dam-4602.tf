module "bc-parks-dam-4602" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "bc-parks-dam-4602"
  client_name        = "BC Parks DAM"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://devapps.nrs.gov.bc.ca/int/parksdam/"
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
