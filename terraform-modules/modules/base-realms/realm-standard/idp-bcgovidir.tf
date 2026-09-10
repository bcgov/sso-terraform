module "bcgovidir_idp" {
  source                = "../../oidc-idp"
  realm_id              = module.realm.id
  alias                 = var.bcgovidir_realm_name
  display_name          = "BCGOV IDIR"
  gui_order             = "9"
  authorization_url     = "${var.keycloak_url}/auth/realms/${var.bcgovidir_realm_name}/protocol/openid-connect/auth"
  token_url             = "${var.keycloak_url}/auth/realms/${var.bcgovidir_realm_name}/protocol/openid-connect/token"
  user_info_url         = "${var.keycloak_url}/auth/realms/${var.bcgovidir_realm_name}/protocol/openid-connect/userinfo"
  jwks_url              = "${var.keycloak_url}/auth/realms/${var.bcgovidir_realm_name}/protocol/openid-connect/certs"
  logout_url            = "${var.keycloak_url}/auth/realms/${var.bcgovidir_realm_name}/protocol/openid-connect/logout"
  client_id             = var.bcgovidir_client_id
  client_secret         = var.bcgovidir_client_secret
  backchannel_supported = false

  post_broker_login_flow_alias = keycloak_authentication_flow.idp_post_login.alias
}

module "bcgovidir_idp_mappers" {
  source    = "../../idp-attribute-mappers"
  realm_id  = module.realm.id
  idp_alias = module.bcgovidir_idp.alias

  attributes = local.bcgovidir_attributes
}

resource "keycloak_custom_identity_provider_mapper" "bcgovidir_username" {
  realm                    = module.realm.id
  name                     = "bcgovidir_username"
  identity_provider_alias  = module.bcgovidir_idp.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
