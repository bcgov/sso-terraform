variable "realm_id" {
  description = "The realm this client is attached to."
}

variable "client_id" {
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens."
}

variable "client_name" {
  description = "The display name of this client in the GUI."
  default     = ""
}

variable "enabled" {
  description = "When false, this client will not be able to initiate a login or obtain access tokens."
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of this client in the GUI."
  default     = "Created without CSS app"
}

variable "access_token_lifespan" {
  description = "The amount of time in seconds before an access token expires. This will override the default for the realm."
  default     = ""
}

variable "client_offline_session_idle_timeout" {
  description = "Time a client session is allowed to be idle before it expires. Tokens are invalidated when a client session is expired. If not set it uses the standard SSO Session Idle value."
  default     = ""
}

variable "client_offline_session_max_lifespan" {
  description = "Max time before a client session is expired. Tokens are invalidated when a client session is expired. If not set, it uses the standard SSO Session Max value."
  default     = ""
}

variable "client_session_idle_timeout" {
  description = "Time a client offline session is allowed to be idle before it expires. Offline tokens are invalidated when a client offline session is expired. If not set it uses the Offline Session Idle value."
  default     = ""
}

variable "client_session_max_lifespan" {
  description = "Max time before a client offline session is expired. Offline tokens are invalidated when a client offline session is expired. If not set, it uses the Offline Session Max value."
  default     = ""
}

variable "team_id" {
  description = "The team id this service client is associated with."
}
