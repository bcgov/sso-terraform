module "keycloak_dev" {
  source = "./keycloak-dev"

  client_id                          = var.dev_client_id
  client_secret                      = var.dev_client_secret
  keycloak_url                       = var.dev_keycloak_url
  username                           = var.dev_username
  password                           = var.dev_password
  siteminder_signing_certificate     = var.test_siteminder_signing_certificate
  azureidir_tenant_id                = var.dev_azureidir_tenant_id
  azureidir_client_id                = var.dev_azureidir_client_id
  azureidir_client_secret            = var.dev_azureidir_client_secret
  github_client_id                   = var.dev_github_client_id
  github_client_secret               = var.dev_github_client_secret
  verifiablecredential_client_id     = var.dev_verifiablecredential_client_id
  verifiablecredential_client_secret = var.dev_verifiablecredential_client_secret

}

module "keycloak_test" {
  source = "./keycloak-test"

  client_id                          = var.test_client_id
  client_secret                      = var.test_client_secret
  keycloak_url                       = var.test_keycloak_url
  username                           = var.test_username
  password                           = var.test_password
  siteminder_signing_certificate     = var.test_siteminder_signing_certificate
  azureidir_tenant_id                = var.test_azureidir_tenant_id
  azureidir_client_id                = var.test_azureidir_client_id
  azureidir_client_secret            = var.test_azureidir_client_secret
  github_client_id                   = var.test_github_client_id
  github_client_secret               = var.test_github_client_secret
  verifiablecredential_client_id     = var.test_verifiablecredential_client_id
  verifiablecredential_client_secret = var.test_verifiablecredential_client_secret
}

module "keycloak_prod" {
  source = "./keycloak-prod"

  client_id                          = var.prod_client_id
  client_secret                      = var.prod_client_secret
  keycloak_url                       = var.prod_keycloak_url
  username                           = var.prod_username
  password                           = var.prod_password
  siteminder_signing_certificate     = var.prod_siteminder_signing_certificate
  azureidir_tenant_id                = var.prod_azureidir_tenant_id
  azureidir_client_id                = var.prod_azureidir_client_id
  azureidir_client_secret            = var.prod_azureidir_client_secret
  github_client_id                   = var.prod_github_client_id
  github_client_secret               = var.prod_github_client_secret
  verifiablecredential_client_id     = var.prod_verifiablecredential_client_id
  verifiablecredential_client_secret = var.prod_verifiablecredential_client_secret
}
