resource "keycloak_oidc_identity_provider" "ppid_service_account" {
  realm             = module.realm.id
  alias             = "ppid-service-account"
  display_name      = "PPID Service Account"
  authorization_url = var.ppid_api_url
  client_id         = var.ppid_client_id
  client_secret     = var.ppid_client_secret
  token_url         = var.ppid_token_url
  issuer            = var.ppid_issuer

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
