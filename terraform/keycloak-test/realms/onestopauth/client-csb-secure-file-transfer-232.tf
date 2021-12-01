data "keycloak_authentication_flow" "csb_secure_file_transfer_232_browserflow" {
  realm_id = data.keycloak_realm.this.id
  alias    = "IDIR redirector"
}
module "client_csb-secure-file-transfer-232" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "csb-secure-file-transfer-232"
  valid_redirect_uris = [
    "https://test.jag.gov.bc.ca/court-nextcloud/*"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.csb_secure_file_transfer_232_browserflow.id
}
