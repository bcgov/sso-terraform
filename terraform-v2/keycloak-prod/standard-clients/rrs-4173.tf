module "rrs-4173" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "rrs-4173"
  client_name        = "RRS"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://apps.nrs.gov.bc.ca/int/rrs-web/"
  ]
  idps = [
    "idir",
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
