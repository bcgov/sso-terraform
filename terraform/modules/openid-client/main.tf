# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/openid_client
resource "keycloak_openid_client" "this" {
  realm_id = var.realm_id

  client_id   = var.client_id != "" ? var.client_id : var.client_name
  name        = var.client_name
  description = var.description
  login_theme = var.login_theme

  enabled                      = var.enabled
  standard_flow_enabled        = var.standard_flow_enabled
  implicit_flow_enabled        = var.implicit_flow_enabled
  direct_access_grants_enabled = var.direct_access_grants_enabled
  service_accounts_enabled     = var.service_accounts_enabled

  access_type   = var.access_type
  client_secret = var.client_secret

  valid_redirect_uris = var.valid_redirect_uris
  web_origins         = var.web_origins

  root_url  = var.root_url
  admin_url = var.admin_url
  base_url  = var.base_url

  pkce_code_challenge_method = var.pkce_code_challenge_method
  full_scope_allowed         = var.full_scope_allowed

  access_token_lifespan               = var.access_token_lifespan
  client_offline_session_idle_timeout = var.client_offline_session_idle_timeout
  client_offline_session_max_lifespan = var.client_offline_session_max_lifespan
  client_session_idle_timeout         = var.client_session_idle_timeout
  client_session_max_lifespan         = var.client_session_max_lifespan

  consent_required                         = var.consent_required
  exclude_session_state_from_auth_response = var.exclude_session_state_from_auth_response
}

resource "keycloak_generic_client_protocol_mapper" "identity_provider_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.this.id
  name            = "IDP"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usersessionmodel-note-mapper"
  config = {
    "user.session.note" : "identity_provider",
    "claim.name" : "identity_provider",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "access.tokenResponse.claim" : "false"
  }
}

resource "keycloak_generic_client_protocol_mapper" "idir_userid_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.this.id
  name            = "idir_userid"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "idir_userid",
    "claim.name" : "idir_userid",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}

resource "keycloak_generic_client_protocol_mapper" "bceid_userid_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.this.id
  name            = "bceid_userid"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "bceid_userid",
    "claim.name" : "bceid_userid",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}
