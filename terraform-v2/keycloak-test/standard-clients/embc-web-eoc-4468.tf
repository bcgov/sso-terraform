module "embc-web-eoc-4468" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "embc-web-eoc-4468"
  client_name        = "EMBC WebEOC"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "https://bc.demo.webeocasp.com/bc/*"
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
