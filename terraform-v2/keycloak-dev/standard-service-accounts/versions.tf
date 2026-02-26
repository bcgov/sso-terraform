terraform {
  required_version = ">= 1.11.0"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">=3.8.1"
    }
  }
}
