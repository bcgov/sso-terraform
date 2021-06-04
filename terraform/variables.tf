# KEYCLOAK_DEV
variable "dev_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "dev_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "dev_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "dev_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "dev_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://dev.oidc.gov.bc.ca"
}

# KEYCLOAK_TEST
variable "test_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "test_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "test_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "test_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "test_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://test.oidc.gov.bc.ca"
}

# KEYCLOAK_PROD
variable "prod_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "prod_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "prod_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "prod_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "prod_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://oidc.gov.bc.ca"
}
