resource "keycloak_saml_identity_provider" "this" {
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

  entity_id                  = var.entity_id
  single_sign_on_service_url = var.single_sign_on_service_url
  single_logout_service_url  = var.single_logout_service_url
  backchannel_supported      = var.backchannel_supported
  name_id_policy_format      = var.name_id_policy_format
  principal_type             = var.principal_type

  post_binding_response      = var.post_binding_response
  post_binding_authn_request = var.post_binding_authn_request
  post_binding_logout        = var.post_binding_logout

  want_assertions_signed    = var.want_assertions_signed
  want_assertions_encrypted = var.want_assertions_encrypted

  force_authn         = var.force_authn
  validate_signature  = var.validate_signature
  signing_certificate = var.signing_certificate

  authn_context_comparison_type = "exact"
}
