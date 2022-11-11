terraform {
  required_version = ">= 1.1.4"

  backend "s3" {
    bucket         = "xgr00q-prod-keycloak"
    key            = "keycloak/gold-custom"
    region         = "ca-central-1"
    dynamodb_table = "xgr00q-prod-state-locking"
  }

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.10.0"
    }
  }
}
