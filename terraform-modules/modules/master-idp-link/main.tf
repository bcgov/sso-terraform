data "keycloak_realm" "master" {
  realm = "master"
}

module "idp_client" {
  source              = "../standard-idp-client"
  realm_id            = var.idp_realm_id
  client_id           = "master-realm"
  valid_redirect_uris = ["${var.keycloak_url}/auth/realms/master/broker/${var.idp_realm_name}/endpoint"]
  public_attrs        = var.idp_public_attrs
  sub_to_username     = var.sub_to_username
}

module "idp_auth_flow" {
  source   = "../otp-auth-flow"
  realm_id = data.keycloak_realm.master.id
  suffix   = var.idp_realm_name
}

module "master_idp" {
  source                       = "../oidc-idp"
  realm_id                     = data.keycloak_realm.master.id
  alias                        = var.idp_realm_name
  display_name                 = var.idp_display_name
  authorization_url            = "${var.keycloak_url}/auth/realms/${var.idp_realm_name}/protocol/openid-connect/auth"
  token_url                    = "${var.keycloak_url}/auth/realms/${var.idp_realm_name}/protocol/openid-connect/token"
  user_info_url                = "${var.keycloak_url}/auth/realms/${var.idp_realm_name}/protocol/openid-connect/userinfo"
  jwks_url                     = "${var.keycloak_url}/auth/realms/${var.idp_realm_name}/protocol/openid-connect/certs"
  post_broker_login_flow_alias = var.otp_required == true ? module.idp_auth_flow.flow_alias : ""
  client_id                    = module.idp_client.client_id
  client_secret                = module.idp_client.client_secret
}

module "master_idp_mappers" {
  source    = "../idp-attribute-mappers"
  realm_id  = data.keycloak_realm.master.id
  idp_alias = var.idp_realm_name

  attributes = var.idp_public_attrs
}

resource "keycloak_custom_identity_provider_mapper" "master_idp_username" {
  realm                    = data.keycloak_realm.master.id
  name                     = "username"
  identity_provider_alias  = var.idp_realm_name
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.preferred_username}@$${ALIAS}"
  }
}
