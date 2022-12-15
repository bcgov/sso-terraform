variable "client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "admin-cli"
  type        = string
}

variable "client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
  type        = string
  sensitive   = true
}

variable "username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string

}

variable "password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "http://localhost:8080"
  type        = string
}
