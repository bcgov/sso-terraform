module "client_work-bc-teacher-resources" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "work-bc-teacher-resources"
  valid_redirect_uris = ["https://careereducation.workbc.ca/openid-connect/keycloak"]

}
