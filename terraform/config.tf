terraform {
  required_version = ">= 0.15.3"

  backend "s3" {
    bucket = "xgr00q-prod-keycloak"
    key    = "keycloak/silver"
    region = "ca-central-1"
  }
}
