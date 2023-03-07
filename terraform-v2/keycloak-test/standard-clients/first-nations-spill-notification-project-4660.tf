module "first-nations-spill-notification-project-4660" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "first-nations-spill-notification-project-4660"
  client_name        = "First Nations Spill Notification Project"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://portal-test.peasi.ca/sso/saml/02b67544-02f5-4309-b08d-2b032b6e4ec5/acs/"
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
