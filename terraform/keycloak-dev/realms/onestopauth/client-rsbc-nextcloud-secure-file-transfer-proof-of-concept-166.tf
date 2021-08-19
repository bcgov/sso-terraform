module "client_rsbc-nextcloud-secure-file-transfer-proof-of-concept-166" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "rsbc-nextcloud-secure-file-transfer-proof-of-concept-166"
  valid_redirect_uris = [
    "https://court-sft-dev.apps.silver.devops.gov.bc.ca"
  ]
}
