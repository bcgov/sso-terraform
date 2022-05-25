terraform {
  required_version = ">= 1.1.4"

  backend "s3" {
    bucket = "xgr00q-prod-keycloak"
    key    = "keycloak/gold"
    region = "ca-central-1"
  }
}
