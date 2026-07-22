resource "keycloak_oidc_identity_provider" "ppid_service_account" {
  realm         = module.realm.id
  alias         = "ppid-service-account"
  display_name  = "PPID Service Account"
  client_id     = var.ppid_client_id
  client_secret = var.ppid_client_secret

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}
