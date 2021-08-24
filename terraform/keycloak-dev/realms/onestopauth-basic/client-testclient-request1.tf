module "client_testclient-request1" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "testclient-request1"
  valid_redirect_uris = ["*"]

}
