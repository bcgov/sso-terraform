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

variable "dev_event_realms" {
  description = "The realms to enable event logging in Dev Keycloak server"
  type        = list(string)
  default = [
    "vtkayq4c", // SBC_With_BCEID
    "v45fd2kb", // Student Online
    "ytaqhqia", // BCStats
    "fcf0kpqr", // registries
    "tz0e228w", // Court Services
  ]
}

variable "test_event_realms" {
  description = "The realms to enable event logging in Test Keycloak server"
  type        = list(string)
  default = [
    "vtkayq4c", // SBC_With_BCEID
    "v45fd2kb", // Student Online
    "ytaqhqia", // BCStats
    "fcf0kpqr", // registries
    "tz0e228w", // Court Services
  ]
}

variable "prod_event_realms" {
  description = "The realms to enable event logging in Prod Keycloak server"
  type        = list(string)
  default     = []
}
