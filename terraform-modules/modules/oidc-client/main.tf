# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/openid_client
resource "keycloak_openid_client" "this" {
  realm_id = var.realm_id

  client_id   = var.client_id
  name        = var.name != "" ? var.name : var.client_id
  description = var.description
  login_theme = var.login_theme

  enabled                      = var.enabled
  standard_flow_enabled        = var.standard_flow_enabled
  implicit_flow_enabled        = var.implicit_flow_enabled
  direct_access_grants_enabled = var.direct_access_grants_enabled
  service_accounts_enabled     = var.access_type != "CONFIDENTIAL" ? false : var.service_accounts_enabled

  access_type   = var.access_type
  client_secret = var.client_secret

  valid_redirect_uris = var.valid_redirect_uris
  web_origins         = var.web_origins

  root_url  = var.root_url
  admin_url = var.admin_url
  base_url  = var.base_url

  pkce_code_challenge_method = var.pkce_code_challenge_method
  full_scope_allowed         = var.full_scope_allowed

  backchannel_logout_url                     = var.backchannel_logout_url
  backchannel_logout_session_required        = var.backchannel_logout_session_required
  backchannel_logout_revoke_offline_sessions = var.backchannel_logout_revoke_offline_sessions

  access_token_lifespan               = var.access_token_lifespan
  client_offline_session_idle_timeout = var.client_offline_session_idle_timeout
  client_offline_session_max_lifespan = var.client_offline_session_max_lifespan
  client_session_idle_timeout         = var.client_session_idle_timeout
  client_session_max_lifespan         = var.client_session_max_lifespan

  consent_required                         = var.consent_required
  exclude_session_state_from_auth_response = var.exclude_session_state_from_auth_response

  dynamic "authentication_flow_binding_overrides" {
    for_each = toset(var.override_authentication_flow ? ["1"] : [])
    content {
      browser_id      = var.browser_authentication_flow
      direct_grant_id = var.direct_grant_authentication_flow
    }
  }
}
