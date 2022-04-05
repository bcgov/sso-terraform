# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/oidc_identity_provider
resource "keycloak_oidc_identity_provider" "idir" {
  realm        = module.realm.id
  alias        = var.idir_realm_name
  display_name = var.idir_realm_name

  enabled           = true
  store_token       = true
  authorization_url = "${var.keycloak_url}/auth/realms/${var.idir_realm_name}/protocol/openid-connect/auth"
  token_url         = "${var.keycloak_url}/auth/realms/${var.idir_realm_name}/protocol/openid-connect/token"
  user_info_url     = "${var.keycloak_url}/auth/realms/${var.idir_realm_name}/protocol/openid-connect/userinfo"
  jwks_url          = "${var.keycloak_url}/auth/realms/${var.idir_realm_name}/protocol/openid-connect/certs"
  client_id         = var.idir_client_id
  client_secret     = var.idir_client_secret

  validate_signature = true

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.idir.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "display_name"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_idir_username" {
  realm                    = module.realm.id
  name                     = "idir_username"
  identity_provider_alias  = keycloak_oidc_identity_provider.idir.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "idir_username"
    "user.attribute" = "idir_username"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_idir_user_guid" {
  realm                    = module.realm.id
  name                     = "idir_user_guid"
  identity_provider_alias  = keycloak_oidc_identity_provider.idir.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "idir_user_guid"
    "user.attribute" = "idir_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_username" {
  realm                    = module.realm.id
  name                     = "username"
  identity_provider_alias  = keycloak_oidc_identity_provider.idir.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
