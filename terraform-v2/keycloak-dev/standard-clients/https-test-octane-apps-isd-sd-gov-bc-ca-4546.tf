module "https-test-octane-apps-isd-sd-gov-bc-ca-4546" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "https-test-octane-apps-isd-sd-gov-bc-ca-4546"
  client_name        = "https://test-octane.apps-isd.sd.gov.bc.ca"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://test-octane.apps-isd.sd.gov.bc.ca/osp/a/au/auth/saml2/spassertion_consumer"
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
