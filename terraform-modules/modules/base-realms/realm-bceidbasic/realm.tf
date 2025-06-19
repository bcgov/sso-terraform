module "realm" {
  source       = "../../realm"
  realm_name   = var.realm_name
  display_name = "Basic BCeID"
}

resource "keycloak_openid_client_scope" "idp_scope" {
  realm_id               = module.realm.id
  name                   = var.realm_name
  description            = "${var.realm_name} idp client scope"
  include_in_token_scope = false
}

data "keycloak_authentication_execution" "browser_identity_provider_redirector" {
  realm_id          = module.realm.id
  parent_flow_alias = "browser"
  provider_id       = "identity-provider-redirector"
}

resource "keycloak_authentication_execution_config" "browser_identity_provider_redirector_config" {
  realm_id     = module.realm.id
  execution_id = data.keycloak_authentication_execution.browser_identity_provider_redirector.id
  alias        = var.realm_name
  config = {
    defaultProvider = var.realm_name
  }
}

resource "keycloak_openid_client" "logout_redirect_uri_delegator" {
  realm_id = module.realm.id

  client_id   = "logout-redirect-uri-delegator"
  name        = "logout redirect uri delegator"
  description = "this client allows post-logout redirect URIs within the KC server"

  enabled                      = false
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type = "CONFIDENTIAL"

  root_url            = "$${authBaseUrl}"
  admin_url           = "/"
  valid_redirect_uris = ["/realms/*"]
  web_origins         = ["+"]
}
