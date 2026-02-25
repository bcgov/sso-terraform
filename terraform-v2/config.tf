terraform {
  required_version = ">= 1.1.4"

  backend "s3" {
    bucket = "b46814-dev-keycloak"
    key    = "keycloak/gold"
    region = "ca-central-1"
  }

  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.4.0"
    }
  }
}
