module "standard_oidc_client" {
  source = "../oidc-client"

  realm_id = var.realm_id

  client_id   = var.client_id
  name        = var.client_name
  description = var.description
  login_theme = var.login_theme

  enabled                      = var.enabled
  standard_flow_enabled        = var.standard_flow_enabled
  implicit_flow_enabled        = var.implicit_flow_enabled
  direct_access_grants_enabled = var.direct_access_grants_enabled
  service_accounts_enabled     = var.access_type != "CONFIDENTIAL" ? false : var.service_accounts_enabled

  access_type   = var.access_type
  client_secret = var.client_secret

  valid_redirect_uris = var.standard_flow_enabled ? var.valid_redirect_uris : []
  web_origins         = var.web_origins

  pkce_code_challenge_method = var.access_type == "PUBLIC" ? "S256" : var.pkce_code_challenge_method

  access_token_lifespan               = var.access_token_lifespan
  client_offline_session_idle_timeout = var.client_offline_session_idle_timeout
  client_offline_session_max_lifespan = var.client_offline_session_max_lifespan
  client_session_idle_timeout         = var.client_session_idle_timeout
  client_session_max_lifespan         = var.client_session_max_lifespan

  override_authentication_flow     = var.override_authentication_flow
  browser_authentication_flow      = var.browser_authentication_flow
  direct_grant_authentication_flow = var.direct_grant_authentication_flow
}

# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/role
resource "keycloak_role" "client_role" {
  for_each = { for v in var.roles : v => v }

  realm_id    = var.realm_id
  client_id   = module.standard_oidc_client.id
  name        = each.value
  description = each.value
}

resource "keycloak_openid_client_default_scopes" "idp_scopes" {
  realm_id  = var.realm_id
  client_id = module.standard_oidc_client.id

  default_scopes = distinct(concat(["common", "profile", "email"], var.idps))
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = module.standard_oidc_client.id

  optional_scopes = [
    "offline_access",
  ]
}

resource "keycloak_generic_protocol_mapper" "client_roles_mapper" {
  realm_id        = var.realm_id
  client_id       = module.standard_oidc_client.id
  name            = "client_roles"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-client-role-mapper"
  config = {
    "claim.name" : "client_roles",
    "jsonType.label" : "String",
    "usermodel.clientRoleMapping.clientId" : var.client_id,
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "multivalued" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "additional_client_roles_mapper" {
  count           = var.additional_role_attribute != "" ? 1 : 0
  realm_id        = var.realm_id
  client_id       = module.standard_oidc_client.id
  name            = "additional_client_roles"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-client-role-mapper"
  config = {
    "claim.name" : var.additional_role_attribute,
    "jsonType.label" : "String",
    "usermodel.clientRoleMapping.clientId" : var.client_id,
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "multivalued" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "access_token_aud" {
  realm_id        = var.realm_id
  client_id       = module.standard_oidc_client.id
  name            = "access_token_aud"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-audience-mapper"
  config = {
    "included.client.audience" : var.client_id,
    "id.token.claim" : "false",
    "access.token.claim" : "true",
  }
}

resource "keycloak_role" "realm_role" {
  realm_id    = var.realm_id
  name        = "client-${module.standard_oidc_client.client_id}"
  description = "Role for client: ${module.standard_oidc_client.client_id}"
}
