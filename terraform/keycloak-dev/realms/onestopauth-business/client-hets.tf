module "client_hets" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "hets"
  valid_redirect_uris = ["https://hets-e0cee6-dev.apps.silver.devops.gov.bc.ca", "https://dev-hets.th.gov.bc.ca", "http://localhost:3000"]

}
