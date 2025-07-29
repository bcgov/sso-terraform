resource "keycloak_oidc_identity_provider" "this" {
  realm        = var.realm_id
  alias        = var.alias
  display_name = var.display_name != "" ? var.display_name : var.alias

  enabled                       = var.enabled
  store_token                   = var.store_token
  add_read_token_role_on_create = var.add_read_token_role_on_create
  trust_email                   = var.trust_email
  link_only                     = var.link_only
  hide_on_login_page            = var.hide_on_login_page
  gui_order                     = var.gui_order
  first_broker_login_flow_alias = var.first_broker_login_flow_alias
  post_broker_login_flow_alias  = var.post_broker_login_flow_alias
  sync_mode                     = var.sync_mode

  authorization_url = var.authorization_url
  token_url         = var.token_url
  user_info_url     = var.user_info_url
  jwks_url          = var.jwks_url
  logout_url        = var.logout_url

  client_id     = var.client_id
  client_secret = var.client_secret

  validate_signature = var.validate_signature

  default_scopes = var.default_scopes

  login_hint                              = var.login_hint
  ui_locales                              = var.ui_locales
  backchannel_supported                   = var.backchannel_supported
  disable_user_info                       = var.disable_user_info
  accepts_prompt_none_forward_from_client = var.accepts_prompt_none_forward_from_client

  extra_config = merge({
    "clientAuthMethod"  = var.client_auth_method
    "tooltip"           = var.tooltip != "" ? var.tooltip : null
    "forwardParameters" = var.forwardParameters != "" ? var.forwardParameters : null
  }, var.idp_extra_config != null ? var.idp_extra_config : {})
}
