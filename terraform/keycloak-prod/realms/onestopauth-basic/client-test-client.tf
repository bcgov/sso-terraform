module "client_test-client" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "test-client"
  valid_redirect_uris = ["*"]

}
