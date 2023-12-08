module "bc-parks-dam-4602" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "bc-parks-dam-4602"
  client_name        = "BC Parks DAM"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://dam.lqc63d-prod.nimbus.cloud.gov.bc.ca/plugins/simplesaml/lib/www/module.php/saml/sp/saml2-acs.php/resourcespace-sp"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = ""
  sign_assertions              = false
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
