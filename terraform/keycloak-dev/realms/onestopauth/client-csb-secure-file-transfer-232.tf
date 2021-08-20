module "client_csb-secure-file-transfer-232" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "csb-secure-file-transfer-232"
  valid_redirect_uris = [
    "https://rsft-dev.apps.silver.devops.gov.bc.ca/"
  ]
}
