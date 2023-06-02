module "cmf-sonar-qube-4871" {
  source             = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client-saml"
  realm_id           = var.standard_realm_id
  client_id          = "cmf-sonar-qube-4871"
  client_name        = "CMF SonarQube"
  assertion_lifespan = ""
  valid_redirect_uris = [
    "*",
    "https://sonarqube-48aa05-tools.apps.silver.devops.gov.bc.ca/*"
  ]
  idps = [
    "azureidir",
    "common"
  ]
  description                  = "CSS App Created"
  additional_role_attribute    = ""
  logout_post_binding_url      = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
}
