provider "keycloak" {
  realm         = "master"
  client_id     = var.client_id
  client_secret = var.client_secret
  username      = var.username
  password      = var.password
  url           = var.keycloak_url
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
