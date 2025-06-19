locals {
  display_name = var.display_name != "" ? var.display_name : var.realm_name
}
# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/realm
resource "keycloak_realm" "this" {
  realm             = var.realm_name
  enabled           = var.enabled
  display_name      = local.display_name
  display_name_html = "<b>${local.display_name}</b>"

  login_with_email_allowed = var.login_with_email_allowed
  duplicate_emails_allowed = var.duplicate_emails_allowed

  login_theme = var.login_theme

  revoke_refresh_token                     = var.revoke_refresh_token
  refresh_token_max_reuse                  = var.refresh_token_max_reuse
  sso_session_idle_timeout                 = var.sso_session_idle_timeout # SSO Session Idle
  sso_session_max_lifespan                 = var.sso_session_max_lifespan # SSO Session Max
  client_session_idle_timeout              = var.client_session_idle_timeout
  client_session_max_lifespan              = var.client_session_max_lifespan
  offline_session_idle_timeout             = var.offline_session_idle_timeout             # Offline Session Idle
  offline_session_max_lifespan_enabled     = var.offline_session_max_lifespan_enabled     # Offline Session Max Limited
  offline_session_max_lifespan             = var.offline_session_max_lifespan             # Offline Session Max Lifespan
  access_token_lifespan                    = var.access_token_lifespan                    # Access Token Lifespan
  access_token_lifespan_for_implicit_flow  = var.access_token_lifespan_for_implicit_flow  # Access Token Lifespan For Implicit Flow
  access_code_lifespan                     = var.access_code_lifespan                     # Client login timeout
  access_code_lifespan_login               = var.access_code_lifespan_login               # Login timeout
  access_code_lifespan_user_action         = var.access_code_lifespan_user_action         # Login action timeout
  action_token_generated_by_user_lifespan  = var.action_token_generated_by_user_lifespan  # User-Initiated Action Lifespan
  action_token_generated_by_admin_lifespan = var.action_token_generated_by_admin_lifespan # Default Admin-Initiated Action Lifespan
}

# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/realm_events
resource "keycloak_realm_events" "this" {
  realm_id = keycloak_realm.this.realm

  admin_events_enabled         = var.admin_events_enabled
  admin_events_details_enabled = var.admin_events_details_enabled

  events_enabled      = var.events_enabled
  events_expiration   = var.events_expiration
  enabled_event_types = var.enabled_event_types
  events_listeners    = var.events_listeners
}
