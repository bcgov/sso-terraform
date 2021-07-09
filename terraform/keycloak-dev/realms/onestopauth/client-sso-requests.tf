module "client_sso-requests" {
  source = "../../../modules/openid-client"

  realm_id                   = data.keycloak_realm.this.id
  client_name                = "sso-requests"
  access_type                = "PUBLIC"
  valid_redirect_uris        = ["https://bcgov.github.io/sso-terraform-dev", "http://localhost:3000"]
  web_origins                = ["https://bcgov.github.io", "http://localhost:3000"]
  pkce_code_challenge_method = "S256"
}
