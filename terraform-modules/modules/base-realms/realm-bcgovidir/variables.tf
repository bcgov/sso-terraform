variable "keycloak_url" {
  default = "http://localhost:8080"
  type    = string
}

variable "realm_name" {
  default = "bcgovidir"
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

variable "sandbox_client_redirect_uri" {
  type    = string
  default = "http://localhost:8080/*"
}
