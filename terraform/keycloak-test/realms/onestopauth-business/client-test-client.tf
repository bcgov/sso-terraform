module "client_test-client" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "test-client"
  valid_redirect_uris = ["*"]

}
