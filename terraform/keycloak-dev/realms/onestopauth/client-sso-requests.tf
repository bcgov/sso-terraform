module "client_sso-requests" {
  source = "../../../modules/openid-client"

  realm_id                   = data.keycloak_realm.this.id
  client_name                = "sso-requests"
  access_type                = "PUBLIC"
  valid_redirect_uris        = ["*"]
  web_origins                = ["*"]
  pkce_code_challenge_method = "S256"
}
