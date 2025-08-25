terraform {
  required_version = ">= 1.1.4"

  backend "s3" {
    bucket         = "xgr00q-dev-keycloak"
    key            = "keycloak/gold"
    dynamodb_table = "xgr00q-dev-state-locking"
    region         = "ca-central-1"
  }

  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.4.0"
    }
  }
}
