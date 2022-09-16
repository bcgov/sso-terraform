variable "client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "admin-cli"
}

variable "client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "http://localhost:8080"
}

variable "siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "azureidir_tenant_id" {
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

variable "github_client_id" {
  type      = string
  sensitive = true
}

variable "github_client_secret" {
  type      = string
  sensitive = true
}
