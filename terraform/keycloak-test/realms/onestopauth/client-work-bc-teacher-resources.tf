module "client_work-bc-teacher-resources" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "work-bc-teacher-resources"
  valid_redirect_uris = ["https://careereducation-test.workbc.ca/openid-connect/keycloak"]

}
