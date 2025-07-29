# This module creates a customer-driven realm so that they have the full control of the realm with minimum constraints.
# The custom realms created by this module will have an admin group and a viewer group by default.
# see https://registry.terraform.io/providers/keycloak/keycloak/5.0.0/docs/resources/realm
resource "keycloak_realm" "this" {
  realm   = var.realm_name
  enabled = var.enabled

  lifecycle {
    ignore_changes = [
      display_name,
      display_name_html,
      user_managed_access,
      attributes,
      registration_allowed,
      registration_email_as_username,
      edit_username_allowed,
      reset_password_allowed,
      remember_me,
      verify_email,
      login_with_email_allowed,
      duplicate_emails_allowed,
      ssl_required,
      login_theme,
      account_theme,
      admin_theme,
      email_theme,
      default_signature_algorithm,
      revoke_refresh_token,
      refresh_token_max_reuse,
      sso_session_idle_timeout,
      sso_session_max_lifespan,
      offline_session_idle_timeout,
      offline_session_max_lifespan,
      offline_session_max_lifespan_enabled,
      client_session_idle_timeout,
      client_session_max_lifespan,
      access_token_lifespan,
      access_token_lifespan_for_implicit_flow,
      access_code_lifespan,
      access_code_lifespan_login,
      access_code_lifespan_user_action,
      action_token_generated_by_user_lifespan,
      action_token_generated_by_admin_lifespan,
      oauth2_device_code_lifespan,
      oauth2_device_polling_interval,
      smtp_server,
      internationalization,
      security_defenses,
      password_policy,
      browser_flow,
      registration_flow,
      direct_grant_flow,
      reset_credentials_flow,
      client_authentication_flow,
      docker_authentication_flow,
      otp_policy,
      web_authn_policy,
      web_authn_passwordless_policy,
    ]
  }
}

module "realm_admin" {
  source   = "../realm-admin-role"
  realm_id = keycloak_realm.this.id
}


module "realm_viewer" {
  source   = "../realm-viewer-role"
  realm_id = keycloak_realm.this.id
}

module "realm_admin_master" {
  source     = "../realm-management-role"
  realm_id   = "master"
  client_id  = "${var.realm_name}-realm"
  role_name  = "${var.realm_name}-realm-admin"
  group_name = "${var.realm_name} Realm Administrator"
  target_roles = [
    "create-client",
    "impersonation",
    "manage-authorization",
    "manage-clients",
    "manage-events",
    "manage-identity-providers",
    "manage-realm",
    "manage-users",
    "query-clients",
    "query-groups",
    "query-realms",
    "query-users",
    "view-authorization",
    "view-clients",
    "view-events",
    "view-identity-providers",
    "view-realm",
    "view-users"
  ]

  depends_on = [keycloak_realm.this]
}
