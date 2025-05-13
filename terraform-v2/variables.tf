# KEYCLOAK_DEV
variable "dev_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
  type        = string
}

variable "dev_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
  type        = string
  sensitive   = true
}

variable "dev_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
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
variable "test_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
  type        = string
}

variable "test_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
  type        = string
  sensitive   = true
}

variable "test_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
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
variable "prod_client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
  type        = string
}

variable "prod_client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
  type        = string
  sensitive   = true
}

variable "prod_username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
  type        = string
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

variable "dev_digitalcredential_client_id" {
  type      = string
  sensitive = true
}

variable "dev_digitalcredential_client_secret" {
  type      = string
  sensitive = true
}

variable "test_digitalcredential_client_id" {
  type      = string
  sensitive = true
}

variable "test_digitalcredential_client_secret" {
  type      = string
  sensitive = true
}

variable "prod_digitalcredential_client_id" {
  type      = string
  sensitive = true
}

variable "prod_digitalcredential_client_secret" {
  type      = string
  sensitive = true
}

variable "test_siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "prod_siteminder_signing_certificate" {
  type      = string
  sensitive = true
}

variable "prod_siteminder_single_sign_on_service_url" {
  type      = string
  sensitive = false
  default   = "https://sfs7.gov.bc.ca/affwebservices/public/saml2sso"
}

variable "test_siteminder_single_sign_on_service_url" {
  type      = string
  sensitive = false
  default   = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
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

variable "dev_azureidir_authorization_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "dev_azureidir_token_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "dev_azureidir_user_info_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "dev_azureidir_jwks_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "dev_azureidir_logout_url" {
  type      = string
  sensitive = false
  default   = ""
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

variable "test_azureidir_authorization_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "test_azureidir_token_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "test_azureidir_user_info_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "test_azureidir_jwks_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "test_azureidir_logout_url" {
  type      = string
  sensitive = false
  default   = ""
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

variable "prod_azureidir_authorization_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "prod_azureidir_token_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "prod_azureidir_user_info_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "prod_azureidir_jwks_url" {
  type      = string
  sensitive = false
  default   = ""
}

variable "prod_azureidir_logout_url" {
  type      = string
  sensitive = false
  default   = ""
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

variable "github_org" {
  default = "bcgov bcgov-c BCDevOps"
  type    = string
}
