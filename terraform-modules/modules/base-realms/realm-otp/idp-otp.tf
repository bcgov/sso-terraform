resource "keycloak_oidc_identity_provider" "otp" {
  realm = module.realm.id
  alias = var.realm_name

  enabled     = true
  store_token = false
  sync_mode   = "FORCE"

  client_id     = var.client_id
  client_secret = var.client_secret

  first_broker_login_flow_alias = "first broker login"

  default_scopes = "openid email"

  authorization_url  = var.authorization_url
  token_url          = var.token_url
  jwks_url           = var.jwks_url
  logout_url         = var.logout_url
  validate_signature = true
  disable_user_info  = true

  extra_config = {
    clientAuthMethod = "client_secret_post"
  }
}

resource "keycloak_custom_identity_provider_mapper" "otp_username" {
  realm                    = module.realm.id
  name                     = "username"
  identity_provider_alias  = keycloak_oidc_identity_provider.otp.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.otp_guid}"
  }
}

resource "keycloak_custom_identity_provider_mapper" "otp_email" {
  realm                    = module.realm.id
  name                     = "email"
  identity_provider_alias  = keycloak_oidc_identity_provider.otp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "email"
    "user.attribute" = "email"
  }
}
