module "client_dds-portfolio" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "dds-portfolio"
  valid_redirect_uris = ["https://oauth2fider.apps.silver.devops.gov.bc.ca","https://oauth2fider.apps.silver.devops.gov.bc.ca/settings"]

}
