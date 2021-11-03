module "client_some-other-project-894" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "some-other-project-894"
  valid_redirect_uris = [
    "https://someotherproject.com"
  ]
  description = "CSS App Created"
}
