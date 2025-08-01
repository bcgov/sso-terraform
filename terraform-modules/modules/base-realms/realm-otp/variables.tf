variable "keycloak_url" {
  default = "http://localhost:8080"
  type    = string
}

variable "client_id" {
  type      = string
  sensitive = true
}
variable "client_secret" {
  type      = string
  sensitive = true
}

variable "realm_name" {
  default = "otp"
  type    = string
}

variable "standard_realm_name" {
  default = "standard"
  type    = string
}

variable "sub_to_username" {
  description = "If true, override 'sub' to have 'username' property value in the standard client"
  type        = bool
  default     = false
}

variable "authorization_url" {
  default = ""
  type    = string
}

variable "token_url" {
  default = ""
  type    = string
}

variable "jwks_url" {
  default = ""
  type    = string
}

variable "logout_url" {
  default = ""
  type    = string
}

variable "otp_realm_name" {
  default = "otp"
  type    = string
}

variable "backchannel_supported" {
  description = "Does the external IDP support backchannel logout?"
  default     = false
}
