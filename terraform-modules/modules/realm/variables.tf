variable "realm_name" {}

variable "display_name" {
  default = ""
}

variable "enabled" {
  default = true
}

variable "login_with_email_allowed" {
  default = false
}

variable "duplicate_emails_allowed" {
  default = true
}

variable "login_theme" {
  default = "bcgov"
}

variable "revoke_refresh_token" {
  default = false
}

variable "refresh_token_max_reuse" {
  description = "If enabled a refresh token can only be used number of times specified in 'refresh_token_max_reuse' before they are revoked. If unspecified, refresh tokens can be reused."
  default     = 0
}

variable "sso_session_idle_timeout" {
  description = "The amount of time a session can be idle before it expires."
  default     = "30m"
}

variable "sso_session_max_lifespan" {
  description = "The maximum amount of time before a session expires regardless of activity."
  default     = "10h"
}

variable "client_session_idle_timeout" {
  description = "The default amount of time a client session in this realm can be idle before it expires. If left at 0, the sso_session_idle_timeout will be used."
  default     = "0"
}

variable "client_session_max_lifespan" {
  description = "The default maximum amount of time a client session in this realm will expire in regardless of activity. If left at 0, the sso_session_max_lifespan will be used."
  default     = "0"
}

variable "offline_session_idle_timeout" {
  description = "The amount of time an offline session can be idle before it expires."
  default     = "720h"
}

variable "offline_session_max_lifespan_enabled" {
  description = "Enable `offline_session_max_lifespan`."
  default     = false
}

variable "offline_session_max_lifespan" {
  description = "Max time before an offline session is expired."
  default     = "1440h"
}

variable "access_token_lifespan" {
  description = "The amount of time an access token can be used before it expires."
  default     = "5m"
}

variable "access_token_lifespan_for_implicit_flow" {
  description = "The amount of time an access token issued with the OpenID Connect Implicit Flow can be used before it expires."
  default     = "15m"
}

variable "access_code_lifespan" {
  description = "The maximum amount of time a client has to finish the authorization code flow."
  default     = "1m"
}

variable "access_code_lifespan_login" {
  description = "The maximum amount of time a user is permitted to stay on the login page before the authentication process must be restarted."
  default     = "30m"
}

variable "access_code_lifespan_user_action" {
  description = "The maximum amount of time a user has to complete login related actions, such as updating a password."
  default     = "5m"
}

variable "action_token_generated_by_user_lifespan" {
  description = "The maximum time a user has to use a user-generated permit before it expires."
  default     = "5m"
}

variable "action_token_generated_by_admin_lifespan" {
  description = "The maximum time a user has to use an admin-generated permit before it expires."
  default     = "12h"
}


variable "admin_events_enabled" {
  description = "When true, admin events are saved to the database, making them available through the admin console"
  type        = bool
  default     = true
}

variable "admin_events_details_enabled" {
  description = "When true, saved admin events will included detailed information for create/update requests"
  type        = bool
  default     = true
}

variable "events_enabled" {
  description = "When true, events from enabled_event_types are saved to the database, making them available through the admin console"
  type        = bool
  default     = false
}

variable "events_expiration" {
  description = "The amount of time in seconds events will be saved in the database"
  type        = number
  default     = 7776000 // 90 days
}

variable "enabled_event_types" {
  description = "The event types that will be saved to the database. Omitting this field enables all event types"
  type        = list(string)
  default = [
    "LOGIN",
    "LOGIN_ERROR",
    "LOGOUT",
    "LOGOUT_ERROR",
    "CODE_TO_TOKEN",
    "CODE_TO_TOKEN_ERROR",
    "CLIENT_LOGIN",
    "CLIENT_LOGIN_ERROR",
    "RESTART_AUTHENTICATION",
    "RESTART_AUTHENTICATION_ERROR",
    "IMPERSONATE",
    "IMPERSONATE_ERROR",
    "CUSTOM_REQUIRED_ACTION",
    "CUSTOM_REQUIRED_ACTION_ERROR",
    "TOKEN_EXCHANGE",
    "TOKEN_EXCHANGE_ERROR",
    "OAUTH2_DEVICE_AUTH",
    "OAUTH2_DEVICE_AUTH_ERROR",
    "OAUTH2_DEVICE_VERIFY_USER_CODE",
    "OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR",
    "OAUTH2_DEVICE_CODE_TO_TOKEN",
    "OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR",
    "AUTHREQID_TO_TOKEN",
    "AUTHREQID_TO_TOKEN_ERROR",
    "PERMISSION_TOKEN",
    "REFRESH_TOKEN",
    "REFRESH_TOKEN_ERROR",
    "INTROSPECT_TOKEN",
    "INTROSPECT_TOKEN_ERROR",
    "USER_INFO_REQUEST",
    "USER_INFO_REQUEST_ERROR",
    "IDENTITY_PROVIDER_LOGIN",
    "IDENTITY_PROVIDER_LOGIN_ERROR",
    "IDENTITY_PROVIDER_RESPONSE",
    "IDENTITY_PROVIDER_RESPONSE_ERROR",
    "IDENTITY_PROVIDER_RETRIEVE_TOKEN",
    "IDENTITY_PROVIDER_RETRIEVE_TOKEN_ERROR",
    "CLIENT_INFO",
    "CLIENT_INFO_ERROR",
    "PERMISSION_TOKEN_ERROR"
  ]
}

variable "events_listeners" {
  description = "The event listeners that events should be sent to"
  type        = list(string)
  default     = ["jboss-logging"]
}
