module "client_testclient-request1" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "testclient-request1"
  valid_redirect_uris = ["*"]

}
