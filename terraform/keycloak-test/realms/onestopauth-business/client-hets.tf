module "client_hets" {
  source = "../../../modules/openid-client"

  realm_id                   = data.keycloak_realm.this.id
  client_name                = "hets"
  valid_redirect_uris        = ["https://hets-e0cee6-test.apps.silver.devops.gov.bc.ca", "https://hets-e0cee6-uat.apps.silver.devops.gov.bc.ca", "https://hets-e0cee6-train.apps.silver.devops.gov.bc.ca", "https://tst-hets.th.gov.bc.ca", "https://uat-hets.th.gov.bc.ca", "https://trn-hets.th.gov.bc.ca"]
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"

}
