locals {
  idir_attributes              = ["display_name", "idir_user_guid", "idir_username"]
  azureidir_attributes         = ["display_name", "idir_user_guid", "idir_username", "user_principal_name"]
  bceidbasic_attributes        = ["display_name", "bceid_user_guid", "bceid_username"]
  bceidbusiness_attributes     = ["display_name", "bceid_user_guid", "bceid_business_guid", "bceid_business_name", "bceid_username"]
  bceidboth_attributes         = ["display_name", "bceid_user_guid", "bceid_business_guid", "bceid_business_name", "bceid_username"]
  digitalcredential_attributes = ["vc_presented_attributes", "pres_req_conf_id"]
  githubpublic_attributes      = ["display_name", "github_id", "github_username", "org_verified", "orgs"]
  githubbcgov_attributes       = ["display_name", "github_id", "github_username", "org_verified", "orgs"]
  otp_attributes               = []
}

module "realm" {
  source                               = "../../realm"
  realm_name                           = var.standard_realm_name
  display_name                         = "Single Sign-On"
  login_theme                          = "bcgov-idp-stopper"
  offline_session_max_lifespan_enabled = true
}

module "idp_auth_flow" {
  source   = "../../idp-stopper-auth-flow"
  realm_id = module.realm.id
}

module "client_stopper_auth_flow" {
  source   = "../../client-stopper-auth-flow"
  realm_id = module.realm.id
}

resource "keycloak_authentication_flow" "githubbcgov" {
  realm_id = module.realm.id
  alias    = "github bcgov"
}

resource "keycloak_authentication_execution" "githubbcgov_exec1" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_flow.githubbcgov.alias
  authenticator     = "user-attribute-authenticator"
  requirement       = "REQUIRED"
}

resource "keycloak_authentication_execution_config" "githubbcgov_exec1_config" {
  realm_id     = module.realm.id
  execution_id = keycloak_authentication_execution.githubbcgov_exec1.id
  alias        = "${keycloak_authentication_execution.githubbcgov_exec1.authenticator}-config"
  config = {
    attributeKey   = "org_verified",
    attributeValue = "true",
    errorUrl       = "https://mvp.developer.gov.bc.ca/docs/default/component/css-docs/Are-you-part-of-the-GitHub-BC-Gov-Org"
  }
}

resource "keycloak_authentication_execution" "githubbcgov_exec2" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_flow.githubbcgov.alias
  authenticator     = "client-login-role-binding"
  requirement       = "REQUIRED"
}

resource "keycloak_authentication_flow" "idp_post_login" {
  realm_id = module.realm.id
  alias    = "idp post login"
}

resource "keycloak_authentication_execution" "idp_post_login_exec1" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_flow.idp_post_login.alias
  authenticator     = "client-login-role-binding"
  requirement       = "REQUIRED"
}

resource "keycloak_openid_client" "logout_redirect_uri_delegator" {
  realm_id = module.realm.id

  client_id   = "logout-redirect-uri-delegator"
  name        = "logout redirect uri delegator"
  description = "this client allows all post-logout redirect URIs"

  enabled                      = false
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type = "CONFIDENTIAL"

  root_url            = ""
  valid_redirect_uris = ["*"]
  web_origins         = []
}
