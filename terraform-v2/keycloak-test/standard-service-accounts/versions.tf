terraform {
  required_version = ">= 0.15.3"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.8.1"
    }
  }
}
