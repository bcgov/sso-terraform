module "client_new-client" {
  source = "../../../modules/openid-client"

  realm_id            = data.keycloak_realm.this.id
  client_name         = "new-client"
  valid_redirect_uris = ["*"]

}
