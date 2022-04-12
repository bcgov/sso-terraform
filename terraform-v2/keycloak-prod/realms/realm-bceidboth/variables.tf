variable "keycloak_url" {
  default = "http://localhost:8080"
}

variable "realm_name" {
  default = "bceidboth"
}

variable "standard_realm_name" {
  default = "standard"
}

variable "signing_certificate" {
  type      = string
  sensitive = true
}
