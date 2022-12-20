module "gdx-suite-crm-4453" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "gdx-suite-crm-4453"
  client_name        = "GDX SuiteCRM"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "http://localhost",
    "https://gdx-suitecrm-dev.apps.silver.devops.gov.bc.ca/*"
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
