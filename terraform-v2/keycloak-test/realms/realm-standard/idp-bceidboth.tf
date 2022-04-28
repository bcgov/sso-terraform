module "bceidboth_idp" {
  source            = "github.com/bcgov/sso-terraform-modules?ref=main/modules/oidc-idp"
  realm_id          = module.realm.id
  alias             = var.bceidboth_realm_name
  authorization_url = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/auth"
  token_url         = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/token"
  user_info_url     = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/userinfo"
  jwks_url          = "${var.keycloak_url}/auth/realms/${var.bceidboth_realm_name}/protocol/openid-connect/certs"
  client_id         = var.bceidboth_client_id
  client_secret     = var.bceidboth_client_secret
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "display_name"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_guid" {
  realm                    = module.realm.id
  name                     = "bceid_user_guid"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_user_guid"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_username" {
  realm                    = module.realm.id
  name                     = "bceid_username"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_username"
    "user.attribute" = "bceid_username"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_guid" {
  realm                    = module.realm.id
  name                     = "bceid_business_guid"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_guid"
    "user.attribute" = "bceid_business_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_name" {
  realm                    = module.realm.id
  name                     = "bceid_business_name"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "bceid_business_name"
    "user.attribute" = "bceid_business_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_username" {
  realm                    = module.realm.id
  name                     = "username"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
