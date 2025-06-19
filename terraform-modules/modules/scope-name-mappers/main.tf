resource "keycloak_openid_client_scope" "this" {
  realm_id               = var.realm_id
  name                   = var.scope_name
  description            = "${var.scope_name} client scope"
  include_in_token_scope = true
}

resource "keycloak_generic_protocol_mapper" "given_name" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.this.id
  name            = "given_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-property-mapper"
  config = {
    "introspection.token.claim" : "true",
    "user.attribute" : "firstName",
    "claim.name" : "given_name",
    "access.token.claim" : "true",
    "id.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "jsonType.label" : "String"
  }
}

resource "keycloak_generic_protocol_mapper" "family_name" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.this.id
  name            = "family_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-property-mapper"
  config = {
    "introspection.token.claim" : "true",
    "user.attribute" : "lastName",
    "claim.name" : "family_name",
    "access.token.claim" : "true",
    "id.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "jsonType.label" : "String"
  }
}

resource "keycloak_generic_protocol_mapper" "full_name" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.this.id
  name            = "full_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-full-name-mapper"
  config = {
    "introspection.token.claim" : "false",
    "id.token.claim" : "false",
    "access.token.claim" : "false",
    "userinfo.token.claim" : "false"
  }
}
