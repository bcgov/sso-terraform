module "client_test-958" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "test-958"
  valid_redirect_uris = [
    "https://ww"
  ]
  description = "CSS App Created"
}
