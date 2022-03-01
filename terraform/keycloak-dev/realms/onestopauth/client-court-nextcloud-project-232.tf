data "keycloak_authentication_flow" "court_nextcloud_project_232_browserflow" {
  realm_id = data.keycloak_realm.this.id
  alias    = "IDIR redirector"
}
module "client_court-nextcloud-project-232" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "court-nextcloud-project-232"
  valid_redirect_uris = [
    "https://dev.jag.gov.bc.ca/court-nextcloud/",
    "https://dev.jag.gov.bc.ca/court-nextcloud/*"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.court_nextcloud_project_232_browserflow.id
}
