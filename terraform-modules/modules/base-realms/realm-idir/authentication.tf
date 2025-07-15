resource "keycloak_authentication_flow" "first_broker_login_v2" {
  realm_id = module.realm.id
  alias    = "first broker login v2"
}

resource "keycloak_authentication_execution" "first_broker_login_v2_review_profile" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_flow.first_broker_login_v2.alias
  authenticator     = "idp-review-profile"
  requirement       = "DISABLED"
  priority          = 10
}

resource "keycloak_authentication_subflow" "first_broker_login_v2_user_creation_linking" {
  realm_id          = module.realm.id
  alias             = "user-creation-linking"
  description       = "Flow for the existing/non-existing user alternatives"
  parent_flow_alias = keycloak_authentication_flow.first_broker_login_v2.alias
  provider_id       = "basic-flow"
  requirement       = "REQUIRED"
  priority          = 20
}

resource "keycloak_authentication_execution" "first_broker_login_v2_delete_duplicate_user" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_user_creation_linking.alias
  authenticator     = "idp-delete-user-if-duplicate"
  requirement       = "ALTERNATIVE"
  priority          = 10
}

resource "keycloak_authentication_execution" "first_broker_login_v2_create_unique_user" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_user_creation_linking.alias
  authenticator     = "idp-create-user-if-unique"
  requirement       = "ALTERNATIVE"
  priority          = 20
}

resource "keycloak_authentication_subflow" "first_broker_login_v2_handle_existing_account" {
  realm_id          = module.realm.id
  alias             = "handle-existing-account"
  description       = "Handle what to do if there is existing account with same email/username like authenticated identity provider"
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_user_creation_linking.alias
  provider_id       = "basic-flow"
  requirement       = "ALTERNATIVE"
  priority          = 30
}

resource "keycloak_authentication_execution" "first_broker_login_v2_confirm_link_user" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_handle_existing_account.alias
  authenticator     = "idp-confirm-link"
  requirement       = "REQUIRED"
  priority          = 10
}

resource "keycloak_authentication_subflow" "first_broker_login_v2_account_verification" {
  realm_id          = module.realm.id
  alias             = "account-verification-options"
  description       = "Method with which to verify the existing account"
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_handle_existing_account.alias
  provider_id       = "basic-flow"
  requirement       = "REQUIRED"
  priority          = 20
}

resource "keycloak_authentication_execution" "first_broker_login_v2_email_verification" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_account_verification.alias
  authenticator     = "idp-email-verification"
  requirement       = "ALTERNATIVE"
  priority          = 10
}

resource "keycloak_authentication_subflow" "first_broker_login_v2_account_reauth" {
  realm_id          = module.realm.id
  alias             = "account-verification-by-reauthentication"
  description       = "Verify Existing Account by Re-authentication"
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_account_verification.alias
  provider_id       = "basic-flow"
  requirement       = "ALTERNATIVE"
  priority          = 20
}

resource "keycloak_authentication_execution" "first_broker_login_v2_username_password_form" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_account_reauth.alias
  authenticator     = "idp-username-password-form"
  requirement       = "REQUIRED"
  priority          = 10
}

resource "keycloak_authentication_subflow" "first_broker_login_v2_conditional_otp" {
  realm_id          = module.realm.id
  alias             = "login-conditional-otp"
  description       = "Flow to determine if the OTP is required for the authentication"
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_account_reauth.alias
  provider_id       = "basic-flow"
  requirement       = "CONDITIONAL"
  priority          = 20
}

resource "keycloak_authentication_execution" "first_broker_login_v2_condition_user_configured" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_conditional_otp.alias
  authenticator     = "conditional-user-configured"
  requirement       = "REQUIRED"
  priority          = 10
}

resource "keycloak_authentication_execution" "first_broker_login_v2_otp_form" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_v2_conditional_otp.alias
  authenticator     = "auth-otp-form"
  requirement       = "REQUIRED"
  priority          = 20
}
