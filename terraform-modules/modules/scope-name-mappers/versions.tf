terraform {
  required_version = ">= 1.1.4"

  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">=5.4.0"
    }
  }
}
