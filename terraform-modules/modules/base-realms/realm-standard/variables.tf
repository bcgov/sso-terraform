variable "keycloak_url" {
  default = "http://localhost:8080"
}

variable "standard_realm_name" {
  default = "standard"
}

variable "idir_realm_name" {}
variable "azureidir_realm_name" {}
variable "bceidbasic_realm_name" {}
variable "bceidbusiness_realm_name" {}
variable "bceidboth_realm_name" {}
variable "github_realm_name" {}
variable "otp_realm_name" {}

variable "idir_client_id" {
  type      = string
  sensitive = true
}
variable "idir_client_secret" {
  type      = string
  sensitive = true
}

variable "azureidir_client_id" {
  type      = string
  sensitive = true
}
variable "azureidir_client_secret" {
  type      = string
  sensitive = true
}

variable "bceidbasic_client_id" {
  type      = string
  sensitive = true
}
variable "bceidbasic_client_secret" {
  type      = string
  sensitive = true
}

variable "bceidbusiness_client_id" {
  type      = string
  sensitive = true
}
variable "bceidbusiness_client_secret" {
  type      = string
  sensitive = true
}

variable "bceidboth_client_id" {
  type      = string
  sensitive = true
}
variable "bceidboth_client_secret" {
  type      = string
  sensitive = true
}

variable "github_client_id" {
  type      = string
  sensitive = true
}
variable "github_client_secret" {
  type      = string
  sensitive = true
}

variable "digitalcredential_client_id" {
  type      = string
  sensitive = true
}
variable "digitalcredential_client_secret" {
  type      = string
  sensitive = true
}

variable "digitalcredential_authorization_url" {
  type = string
}

variable "digitalcredential_token_url" {
  type = string
}

variable "add_backwards_compatible_mappers" {
  description = "if true backwards compatible mappers are added to common scope"
  type        = bool
  default     = false
}

variable "otp_client_id" {
  type      = string
  sensitive = true
}
variable "otp_client_secret" {
  type      = string
  sensitive = true
}

variable "ppid_client_id" {
  type      = string
  sensitive = true
}

variable "ppid_client_secret" {
  type      = string
  sensitive = true
}

variable "ppid_api_url" {
  type = string
}

variable "ppid_token_url" {
  type = string
}

variable "ppid_issuer" {
  type = string
}
