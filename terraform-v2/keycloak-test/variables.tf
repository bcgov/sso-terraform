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

variable "siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "siteminder_single_sign_on_service_url" {
  type    = string
  default = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
}

variable "saml_entity_id" {
  type    = string
  default = "https://test.loginproxy.gov.bc.ca/auth/realms/_idir1/"
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

variable "azureidir_authorization_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "azureidir_token_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "azureidir_user_info_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "azureidir_jwks_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "azureidir_logout_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "github_client_id" {
  type      = string
  sensitive = true
}

variable "github_client_secret" {
  type      = string
  sensitive = true
}

variable "github_org" {
  default = "bcgov bcgov-c BCDevOps"
  type    = string
}

variable "digitalcredential_client_id" {
  type      = string
  sensitive = true
}

variable "digitalcredential_client_secret" {
  type      = string
  sensitive = true
}
