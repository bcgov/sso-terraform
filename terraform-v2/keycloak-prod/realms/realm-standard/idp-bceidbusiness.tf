# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/oidc_identity_provider
resource "keycloak_oidc_identity_provider" "bceidbusiness" {
  realm        = module.realm.id
  alias        = var.bceidbusiness_realm_name
  display_name = var.bceidbusiness_realm_name

  enabled           = true
  store_token       = true
  authorization_url = "${var.keycloak_url}/auth/realms/${var.bceidbusiness_realm_name}/protocol/openid-connect/auth"
  token_url         = "${var.keycloak_url}/auth/realms/${var.bceidbusiness_realm_name}/protocol/openid-connect/token"
  user_info_url     = "${var.keycloak_url}/auth/realms/${var.bceidbusiness_realm_name}/protocol/openid-connect/userinfo"
  jwks_url          = "${var.keycloak_url}/auth/realms/${var.bceidbusiness_realm_name}/protocol/openid-connect/certs"
  client_id         = var.bceidbusiness_client_id
  client_secret     = var.bceidbusiness_client_secret

  validate_signature = true

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "display_name"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_bceid_user_guid" {
  realm                    = module.realm.id
  name                     = "bceid_user_guid"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_user_guid"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_bceid_user_name" {
  realm                    = module.realm.id
  name                     = "bceid_user_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_user_name"
    "user.attribute" = "bceid_user_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_bceid_business_guid" {
  realm                    = module.realm.id
  name                     = "bceid_business_guid"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_guid"
    "user.attribute" = "bceid_business_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_bceid_business_name" {
  realm                    = module.realm.id
  name                     = "bceid_business_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_name"
    "user.attribute" = "bceid_business_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_bceid_username" {
  realm                    = module.realm.id
  name                     = "bceid_username"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_username"
    "user.attribute" = "bceid_username"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbusiness_username" {
  realm                    = module.realm.id
  name                     = "username"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidbusiness.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
