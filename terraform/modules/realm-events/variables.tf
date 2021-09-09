variable "realm_id" {
  description = "The realm id to create openid client on"
}

variable "admin_events_enabled" {
  description = "When true, admin events are saved to the database, making them available through the admin console"
  type        = bool
  default     = false
}

variable "admin_events_details_enabled" {
  description = "When true, saved admin events will included detailed information for create/update requests"
  type        = bool
  default     = false
}

variable "events_enabled" {
  description = "When true, events from enabled_event_types are saved to the database, making them available through the admin console"
  type        = bool
  default     = true
}

variable "events_expiration" {
  description = "The amount of time in seconds events will be saved in the database"
  type        = number
  default     = 31536000 // 365 days
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
