# KEYCLOAK_DEV

variable "dev_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "dev_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "dev_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://dev.loginproxy.gov.bc.ca"
  type        = string
}

# KEYCLOAK_TEST

variable "test_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "test_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "test_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://test.loginproxy.gov.bc.ca"
  type        = string
}

# KEYCLOAK_PROD

variable "prod_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "prod_password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
  sensitive   = true
}

variable "prod_keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "https://loginproxy.gov.bc.ca"
  type        = string
}
