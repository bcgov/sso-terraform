module "keycloak_dev" {
  source = "./keycloak-dev"

  keycloak_url                          = var.dev_keycloak_url
  username                              = var.dev_username
  password                              = var.dev_password
  siteminder_signing_certificate        = var.test_siteminder_signing_certificate
  siteminder_single_sign_on_service_url = var.test_siteminder_single_sign_on_service_url
  saml_entity_id_url                    = var.dev_saml_entity_id_url
  azureidir_tenant_id                   = var.dev_azureidir_tenant_id
  azureidir_client_id                   = var.dev_azureidir_client_id
  azureidir_client_secret               = var.dev_azureidir_client_secret
  azureidir_authorization_url           = var.dev_azureidir_authorization_url
  azureidir_token_url                   = var.dev_azureidir_token_url
  azureidir_user_info_url               = var.dev_azureidir_user_info_url
  azureidir_jwks_url                    = var.dev_azureidir_jwks_url
  azureidir_logout_url                  = var.dev_azureidir_logout_url
  github_client_id                      = var.dev_github_client_id
  github_client_secret                  = var.dev_github_client_secret
  github_org                            = var.github_org
  digitalcredential_client_id           = var.dev_digitalcredential_client_id
  digitalcredential_client_secret       = var.dev_digitalcredential_client_secret
  otp_client_id                         = var.dev_otp_client_id
  otp_client_secret                     = var.dev_otp_client_secret
}

module "keycloak_test" {
  source = "./keycloak-test"

  keycloak_url                          = var.test_keycloak_url
  username                              = var.test_username
  password                              = var.test_password
  siteminder_signing_certificate        = var.test_siteminder_signing_certificate
  siteminder_single_sign_on_service_url = var.test_siteminder_single_sign_on_service_url
  saml_entity_id_url                    = var.test_saml_entity_id_url
  azureidir_tenant_id                   = var.test_azureidir_tenant_id
  azureidir_client_id                   = var.test_azureidir_client_id
  azureidir_client_secret               = var.test_azureidir_client_secret
  azureidir_authorization_url           = var.test_azureidir_authorization_url
  azureidir_token_url                   = var.test_azureidir_token_url
  azureidir_user_info_url               = var.test_azureidir_user_info_url
  azureidir_jwks_url                    = var.test_azureidir_jwks_url
  azureidir_logout_url                  = var.test_azureidir_logout_url
  github_client_id                      = var.test_github_client_id
  github_client_secret                  = var.test_github_client_secret
  github_org                            = var.github_org
  digitalcredential_client_id           = var.test_digitalcredential_client_id
  digitalcredential_client_secret       = var.test_digitalcredential_client_secret
  otp_client_id                         = var.test_otp_client_id
  otp_client_secret                     = var.test_otp_client_secret
}

module "keycloak_prod" {
  source = "./keycloak-prod"

  keycloak_url                          = var.prod_keycloak_url
  username                              = var.prod_username
  password                              = var.prod_password
  siteminder_signing_certificate        = var.prod_siteminder_signing_certificate
  siteminder_single_sign_on_service_url = var.prod_siteminder_single_sign_on_service_url
  saml_entity_id_url                    = var.prod_saml_entity_id_url
  saml_idir_override                    = var.prod_saml_idir_override
  saml_bceidbusiness_override           = var.prod_saml_bceidbusiness_override
  saml_bceidbasicbusiness_override      = var.prod_saml_bceidbasicbusiness_override
  saml_bceidbasic_override              = var.prod_saml_bceidbasic_override
  azureidir_tenant_id                   = var.prod_azureidir_tenant_id
  azureidir_client_id                   = var.prod_azureidir_client_id
  azureidir_client_secret               = var.prod_azureidir_client_secret
  azureidir_authorization_url           = var.prod_azureidir_authorization_url
  azureidir_token_url                   = var.prod_azureidir_token_url
  azureidir_user_info_url               = var.prod_azureidir_user_info_url
  azureidir_jwks_url                    = var.prod_azureidir_jwks_url
  azureidir_logout_url                  = var.prod_azureidir_logout_url
  github_client_id                      = var.prod_github_client_id
  github_client_secret                  = var.prod_github_client_secret
  github_org                            = var.github_org
  digitalcredential_client_id           = var.prod_digitalcredential_client_id
  digitalcredential_client_secret       = var.prod_digitalcredential_client_secret
  prod_digital_credential_url           = var.prod_digital_credential_url
  otp_client_id                         = var.prod_otp_client_id
  otp_client_secret                     = var.prod_otp_client_secret
}
