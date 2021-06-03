provider "keycloak" {
  realm         = "master"
  client_id     = var.client_id
  client_secret = var.client_secret
  username      = var.username
  password      = var.password
  url           = var.keycloak_url
}

module "onestopauth" {
  source = "./realms/onestopauth"
}

module "onestopauth_business" {
  source = "./realms/onestopauth-business"
}

module "onestopauth_basic" {
  source = "./realms/onestopauth-basic"
}

module "onestopauth_both" {
  source = "./realms/onestopauth-both"
}
