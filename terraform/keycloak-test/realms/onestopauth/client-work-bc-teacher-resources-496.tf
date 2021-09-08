module "client_work-bc-teacher-resources-496" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "work-bc-teacher-resources-496"
  valid_redirect_uris = [
    "https://test-admin-jobboard.workbc.ca/*"
  ]
}
