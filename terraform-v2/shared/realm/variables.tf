variable "realm_name" {}

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
  default = true
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

variable "offline_session_idle_timeout" {
  description = "The amount of time an offline session can be idle before it expires."
  default     = "720h"
}

variable "offline_session_max_lifespan_enabled" {
  description = "Enable `offline_session_max_lifespan`."
  default     = false
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
