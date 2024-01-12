module "keycloak_dev" {
  source = "./keycloak-dev"

  keycloak_url = var.dev_keycloak_url
  username     = var.dev_username
  password     = var.dev_password
}

module "keycloak_test" {
  source = "./keycloak-test"

  keycloak_url = var.test_keycloak_url
  username     = var.test_username
  password     = var.test_password
}

module "keycloak_prod" {
  source = "./keycloak-prod"

  keycloak_url = var.prod_keycloak_url
  username     = var.prod_username
  password     = var.prod_password
}
