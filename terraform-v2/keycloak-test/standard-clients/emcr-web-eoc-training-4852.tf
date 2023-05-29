module "emcr-web-eoc-training-4852" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "emcr-web-eoc-training-4852"
  client_name        = "EMCR WebEOC TRAINING"
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
  logout_post_binding_url      = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
