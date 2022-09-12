data "keycloak_authentication_flow" "sabc_applications_vss_4099_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "sabc-applications-vss-4099" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "sabc-applications-vss-4099"
  client_name        = "SABC Applications - VSS"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://tbtb-vss-06cb9b-dev.apps.silver.devops.gov.bc.ca/sso-login"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.sabc_applications_vss_4099_browserflow.id
}
