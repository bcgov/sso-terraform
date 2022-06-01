terraform {
  required_version = ">= 1.1.4"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.8.1"
    }
  }
}
