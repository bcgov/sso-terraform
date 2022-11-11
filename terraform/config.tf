terraform {
  required_version = ">= 0.15.3"

  backend "s3" {
    bucket         = "xgr00q-prod-keycloak"
    key            = "keycloak/silver"
    dynamodb_table = "xgr00q-prod-state-locking"
    region         = "ca-central-1"
  }

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.10.0"
    }
  }
}
