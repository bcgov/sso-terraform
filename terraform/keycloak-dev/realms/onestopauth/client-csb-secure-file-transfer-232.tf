module "client_csb-secure-file-transfer-232" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "csb-secure-file-transfer-232"
  valid_redirect_uris = [
    "https://dev.jag.gov.bc.ca/court-nextcloud/*"
  ]
  description = "CSS App Created"
}
