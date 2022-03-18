# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/oidc_identity_provider
resource "keycloak_oidc_identity_provider" "bceidboth" {
  realm        = keycloak_realm.this.id
  alias        = var.bceidboth_realm_name
  display_name = var.bceidboth_realm_name

  enabled           = true
  store_token       = true
  authorization_url = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/auth"
  token_url         = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/token"
  user_info_url     = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/userinfo"
  jwks_url          = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/certs"
  client_id         = var.bceidboth_client_id
  client_secret     = var.bceidboth_client_secret

  validate_signature = true

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_displayname" {
  realm                    = keycloak_realm.this.id
  name                     = "display_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "display_name"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_guid" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_user_guid"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_user_guid"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_username" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_username"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_username"
    "user.attribute" = "bceid_username"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_guid" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_business_guid"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_guid"
    "user.attribute" = "bceid_business_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_name" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_business_name"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_name"
    "user.attribute" = "bceid_business_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_username" {
  realm                    = keycloak_realm.this.id
  name                     = "username"
  identity_provider_alias  = keycloak_oidc_identity_provider.bceidboth.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
