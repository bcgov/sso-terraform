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
  default     = "https://dev.loginproxy.gov.bc.ca"
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
  default     = "https://test.loginproxy.gov.bc.ca"
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
  default     = "https://loginproxy.gov.bc.ca"
}

variable "test_siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "prod_siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "dev_azureidir_tenant_id" {
  type      = string
  sensitive = true
}

variable "dev_azureidir_client_id" {
  type      = string
  sensitive = true
}

variable "dev_azureidir_client_secret" {
  type      = string
  sensitive = true
}

variable "test_azureidir_tenant_id" {
  type      = string
  sensitive = true
}

variable "test_azureidir_client_id" {
  type      = string
  sensitive = true
}

variable "test_azureidir_client_secret" {
  type      = string
  sensitive = true
}

variable "prod_azureidir_tenant_id" {
  type      = string
  sensitive = true
}

variable "prod_azureidir_client_id" {
  type      = string
  sensitive = true
}

variable "prod_azureidir_client_secret" {
  type      = string
  sensitive = true
}

variable "dev_github_client_id" {
  type      = string
  sensitive = true
}

variable "dev_github_client_secret" {
  type      = string
  sensitive = true
}

variable "test_github_client_id" {
  type      = string
  sensitive = true
}

variable "test_github_client_secret" {
  type      = string
  sensitive = true
}

variable "prod_github_client_id" {
  type      = string
  sensitive = true
}

variable "prod_github_client_secret" {
  type      = string
  sensitive = true
}
