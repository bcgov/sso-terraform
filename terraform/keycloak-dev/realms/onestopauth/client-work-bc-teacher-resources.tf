data "keycloak_authentication_flow" "work_bc_browserflow" {
  realm_id = data.keycloak_realm.this.id
  alias    = "IDIR redirector"
}

module "client_work-bc-teacher-resources" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id                     = data.keycloak_realm.this.id
  client_name                  = "work-bc-teacher-resources"
  valid_redirect_uris          = ["https://careereducation-dev.workbc.ca/openid-connect/keycloak"]
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.work_bc_browserflow.id
  enabled                      = false
}
