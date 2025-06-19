# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/saml_client
resource "keycloak_saml_client" "this" {
  realm_id = var.realm_id

  client_id   = var.client_id
  name        = var.name != "" ? var.name : var.client_id
  description = var.description
  login_theme = var.login_theme

  enabled = var.enabled

  include_authn_statement   = var.include_authn_statement
  sign_documents            = var.sign_documents
  sign_assertions           = var.sign_assertions
  encrypt_assertions        = var.encrypt_assertions
  client_signature_required = var.client_signature_required
  force_post_binding        = var.force_post_binding
  force_name_id_format      = var.force_name_id_format
  front_channel_logout      = var.front_channel_logout
  signature_algorithm       = var.signature_algorithm
  name_id_format            = var.name_id_format
  canonicalization_method   = var.canonicalization_method

  valid_redirect_uris        = var.valid_redirect_uris
  root_url                   = var.root_url
  base_url                   = var.base_url
  master_saml_processing_url = var.master_saml_processing_url

  assertion_consumer_post_url         = var.assertion_consumer_post_url
  assertion_consumer_redirect_url     = var.assertion_consumer_redirect_url
  logout_service_post_binding_url     = var.logout_service_post_binding_url
  logout_service_redirect_binding_url = var.logout_service_redirect_binding_url

  idp_initiated_sso_url_name    = var.idp_initiated_sso_url_name
  idp_initiated_sso_relay_state = var.idp_initiated_sso_relay_state

  encryption_certificate = var.encryption_certificate
  signing_certificate    = var.signing_certificate
  signing_private_key    = var.signing_private_key

  full_scope_allowed = var.full_scope_allowed

  extra_config = {
    "saml.assertion.lifespan" : var.assertion_lifespan != "" ? var.assertion_lifespan : null
  }

  dynamic "authentication_flow_binding_overrides" {
    for_each = toset(var.override_authentication_flow ? ["1"] : [])
    content {
      browser_id = var.browser_authentication_flow
    }
  }
}
