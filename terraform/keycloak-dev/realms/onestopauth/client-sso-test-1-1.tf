module "client_sso-test-1-1" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sso-test-1-1"
  valid_redirect_uris = [
    "http://localhost"
  ]
}
