module "apm-open-search-4430" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "https://apm.io.nrs.gov.bc.ca"
  client_name        = "APM - OpenSearch"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://apm.io.nrs.gov.bc.ca/*"
  ]
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = "roles"
  logout_post_binding_url      = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
