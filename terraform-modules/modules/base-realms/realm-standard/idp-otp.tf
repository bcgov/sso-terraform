module "otp_idp" {
  source                = "../../oidc-idp"
  realm_id              = module.realm.id
  alias                 = var.otp_realm_name
  display_name          = "Email"
  gui_order             = "8"
  authorization_url     = "${var.keycloak_url}/auth/realms/${var.otp_realm_name}/protocol/openid-connect/auth"
  token_url             = "${var.keycloak_url}/auth/realms/${var.otp_realm_name}/protocol/openid-connect/token"
  user_info_url         = "${var.keycloak_url}/auth/realms/${var.otp_realm_name}/protocol/openid-connect/userinfo"
  jwks_url              = "${var.keycloak_url}/auth/realms/${var.otp_realm_name}/protocol/openid-connect/certs"
  logout_url            = "${var.keycloak_url}/auth/realms/${var.otp_realm_name}/protocol/openid-connect/logout"
  client_id             = var.otp_client_id
  client_secret         = var.otp_client_secret
  backchannel_supported = false

  post_broker_login_flow_alias = keycloak_authentication_flow.idp_post_login.alias
}

module "otp_idp_mappers" {
  source    = "../../idp-attribute-mappers"
  realm_id  = module.realm.id
  idp_alias = module.otp_idp.alias

  attributes = local.otp_attributes
}

resource "keycloak_custom_identity_provider_mapper" "otp_username" {
  realm                    = module.realm.id
  name                     = "otp_username"
  identity_provider_alias  = module.otp_idp.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
