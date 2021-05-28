provider "keycloak" {
  client_id     = var.client_id
  client_secret = var.client_secret
  username      = "admin"
  password      = "Pa55w0rd"
  url           = "http://127.0.0.1:8080"
}

module "onestopauth" {
  source = "./modules/onestopauth"
}

module "onestopauth_business" {
  source = "./modules/onestopauth-business"
}

module "onestopauth_basic" {
  source = "./modules/onestopauth-basic"
}

module "onestopauth_both" {
  source = "./modules/onestopauth-both"
}
