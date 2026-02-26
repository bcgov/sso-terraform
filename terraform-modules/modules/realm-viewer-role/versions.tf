terraform {
  required_version = ">= 1.11.0"

  required_providers {

    keycloak = {
      source  = "keycloak/keycloak"
      version = ">=5.4.0"
    }
  }
}
