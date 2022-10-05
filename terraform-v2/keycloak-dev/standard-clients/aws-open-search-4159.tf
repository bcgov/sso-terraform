module "aws-open-search-4159" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "aws-open-search-4159"
  client_name        = "AWS OpenSearch"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://apm.io.nrs.gov.bc.ca/*"
  ]
  idps = [
    "idir",
    "azureidir",
    "bceidbusiness",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
