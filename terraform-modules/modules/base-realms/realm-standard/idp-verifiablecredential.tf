module "digitalcredential_idp" {
  source                       = "../../oidc-idp"
  realm_id                     = module.realm.id
  alias                        = "digitalcredential"
  display_name                 = "Digital Credential"
  gui_order                    = "8"
  authorization_url            = var.digitalcredential_authorization_url
  token_url                    = var.digitalcredential_token_url
  client_id                    = var.digitalcredential_client_id
  client_secret                = var.digitalcredential_client_secret
  client_auth_method           = "client_secret_basic"
  validate_signature           = false
  forwardParameters            = "pres_req_conf_id"
  default_scopes               = "vc_authn"
  backchannel_supported        = false
  tooltip                      = "To learn more about using the Digital Credential visit https://github.com/bcgov/sso-keycloak/wiki/Our-Partners-and-Useful-Information"
  post_broker_login_flow_alias = keycloak_authentication_flow.idp_post_login.alias
}

resource "keycloak_custom_identity_provider_mapper" "digitalcredential_username" {
  realm                    = module.realm.id
  name                     = "username"
  identity_provider_alias  = module.digitalcredential_idp.alias
  identity_provider_mapper = "oidc-username-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    template = "$${CLAIM.sub}@$${ALIAS}"
  }
}

resource "keycloak_custom_identity_provider_mapper" "digitalcredential_vc_presented_attributes" {
  realm                    = module.realm.id
  name                     = "vc_presented_attributes"
  identity_provider_alias  = module.digitalcredential_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "vc_presented_attributes"
    "user.attribute" = "vc_presented_attributes"
  }
}

resource "keycloak_custom_identity_provider_mapper" "digitalcredential_pres_req_conf_id" {
  realm                    = module.realm.id
  name                     = "pres_req_conf_id"
  identity_provider_alias  = module.digitalcredential_idp.alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = "pres_req_conf_id"
    "user.attribute" = "pres_req_conf_id"
  }
}
