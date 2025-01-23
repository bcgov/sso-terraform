terraform {
  required_version = ">= 1.1.4"

  backend "s3" {
    bucket         = "xgr00q-prod-keycloak"
    key            = "keycloak/gold"
    dynamodb_table = "xgr00q-prod-state-locking"
    region         = "ca-central-1"
  }

  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.0.0"
    }
  }
}
