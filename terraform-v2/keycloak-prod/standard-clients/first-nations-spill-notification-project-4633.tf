module "first-nations-spill-notification-project-4633" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "first-nations-spill-notification-project-4633"
  client_name        = "First Nations Spill Notification Project"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://portal.alertable.ca/sso/saml/970939fa-56cb-46cb-80ba-865c088c6a2f/acs/"
  ]
  idps = [
    "idir",
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
