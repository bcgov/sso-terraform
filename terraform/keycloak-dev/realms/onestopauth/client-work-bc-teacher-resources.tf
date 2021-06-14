module "client_work-bc-teacher-resources" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "work-bc-teacher-resources"
  valid_redirect_uris = ["http://teacher-resources-bdaa18-dev.apps.silver.devops.gov.bc.ca/"]

}
