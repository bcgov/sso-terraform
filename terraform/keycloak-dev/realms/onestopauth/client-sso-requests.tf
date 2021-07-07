module "client_sso-requests" {
  source = "../../../modules/openid-client"

  realm_id                   = data.keycloak_realm.this.id
  client_name                = "sso-requests"
  access_type                = "PUBLIC"
  valid_redirect_uris        = ["https://bcgov.github.io/sso-terraform-dev"]
  web_origins                = ["https://bcgov.github.io"]
  pkce_code_challenge_method = "S256"
}
