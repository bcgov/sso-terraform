resource "keycloak_oidc_identity_provider" "oidc_custom" {
  realm             = "master"
  provider_id       = "oidc-custom"
  alias             = "oidc-idp-custom"
  client_id         = "oidc-idp-client"
  client_secret     = ""
  authorization_url = ""
  token_url         = ""
}
