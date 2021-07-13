module "client_dds-portfolio" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "dds-portfolio"
  valid_redirect_uris = ["https://oauth2fider.apps.silver.devops.gov.bc.ca", "https://oauth2fider.apps.silver.devops.gov.bc.ca/settings", "https://oauth2fider.apps.silver.devops.gov.bc.ca/oauth/_mtjccwib6k/callback", "http://localhost:8087/*", "https://fcbcfider.apps.silver.devops.gov.bc.ca/oauth/*"]

}
