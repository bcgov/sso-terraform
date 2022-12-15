locals {
  standard_realm_name                   = "standard"
  idir_realm_name                       = "idir"
  azureidir_realm_name                  = "azureidir"
  bceidbasic_realm_name                 = "bceidbasic"
  bceidbusiness_realm_name              = "bceidbusiness"
  bceidboth_realm_name                  = "bceidboth"
  github_realm_name                     = "github"
  siteminder_single_sign_on_service_url = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
  sandbox_keycloak_url                  = "https://sso-keycloak-4-b861c7-test.apps.silver.devops.gov.bc.ca"
}

module "standard" {
  source       = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-standard"
  keycloak_url = var.keycloak_url

  standard_realm_name      = local.standard_realm_name
  idir_realm_name          = local.idir_realm_name
  azureidir_realm_name     = local.azureidir_realm_name
  bceidbasic_realm_name    = local.bceidbasic_realm_name
  bceidbusiness_realm_name = local.bceidbusiness_realm_name
  bceidboth_realm_name     = local.bceidboth_realm_name
  github_realm_name        = local.github_realm_name

  idir_client_id              = module.idir.standard_client_id
  idir_client_secret          = module.idir.standard_client_secret
  azureidir_client_id         = module.azureidir.standard_client_id
  azureidir_client_secret     = module.azureidir.standard_client_secret
  bceidbasic_client_id        = module.bceidbasic.standard_client_id
  bceidbasic_client_secret    = module.bceidbasic.standard_client_secret
  bceidbusiness_client_id     = module.bceidbusiness.standard_client_id
  bceidbusiness_client_secret = module.bceidbusiness.standard_client_secret
  bceidboth_client_id         = module.bceidboth.standard_client_id
  bceidboth_client_secret     = module.bceidboth.standard_client_secret
  github_client_id            = module.github.standard_client_id
  github_client_secret        = module.github.standard_client_secret
}

module "idir" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-idir"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.idir_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_idir1/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
  sub_to_username            = true
  sandbox_keycloak_url       = local.sandbox_keycloak_url
}

module "azureidir" {
  source               = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-azureidir"
  keycloak_url         = var.keycloak_url
  realm_name           = local.azureidir_realm_name
  standard_realm_name  = local.standard_realm_name
  azure_tenant_id      = var.azureidir_tenant_id
  azure_client_id      = var.azureidir_client_id
  azure_client_secret  = var.azureidir_client_secret
  sub_to_username      = true
  sandbox_keycloak_url = local.sandbox_keycloak_url
}

module "bceidbasic" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-bceidbasic"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidbasic_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbasic1/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
  sub_to_username            = true
  sandbox_keycloak_url       = local.sandbox_keycloak_url
}


module "bceidbusiness" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-bceidbusiness"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidbusiness_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbusiness1/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
  sub_to_username            = true
  sandbox_keycloak_url       = local.sandbox_keycloak_url
}

module "bceidboth" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-bceidboth"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidboth_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbasicbusiness1/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
  sub_to_username            = true
  sandbox_keycloak_url       = local.sandbox_keycloak_url
}

module "github" {
  source              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/base-realms/realm-github"
  keycloak_url        = var.keycloak_url
  realm_name          = local.github_realm_name
  standard_realm_name = local.standard_realm_name
  client_id           = var.github_client_id
  client_secret       = var.github_client_secret
  github_org          = "bcgov bcgov-c BCDevOps"
  sub_to_username     = true
}

module "standard_clients" {
  source            = "./standard-clients"
  standard_realm_id = module.standard.realm_id
}

module "standard_service_clients" {
  source            = "./standard-service-accounts"
  standard_realm_id = module.standard.realm_id
}

module "master_idir_link" {
  source           = "github.com/bcgov/sso-terraform-modules?ref=main/modules/master-idp-link"
  keycloak_url     = var.keycloak_url
  idp_realm_id     = module.idir.realm_id
  idp_realm_name   = module.idir.realm_name
  idp_display_name = "IDIR"
  idp_public_attrs = ["display_name", "idir_user_guid", "idir_username"]
}

module "master_azureidir_link" {
  source           = "github.com/bcgov/sso-terraform-modules?ref=main/modules/master-idp-link"
  keycloak_url     = var.keycloak_url
  idp_realm_id     = module.azureidir.realm_id
  idp_realm_name   = module.azureidir.realm_name
  idp_display_name = "Azure IDIR"
  idp_public_attrs = ["display_name", "idir_user_guid", "idir_username"]
}

module "master_viewer_role" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/master-viewer-role"
  realm_names = ["master", "standard", "idir", "azureidir", "bceidbasic", "bceidbusiness", "bceidboth"]

  depends_on = [
    module.standard,
    module.idir,
    module.azureidir,
    module.bceidbasic,
    module.bceidbusiness,
    module.bceidboth,
  ]
}

resource "keycloak_realm_events" "master_events" {
  realm_id = "master"

  admin_events_enabled         = true
  admin_events_details_enabled = true

  events_listeners = [
    "jboss-logging"
  ]
}
