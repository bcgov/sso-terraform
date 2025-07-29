resource "keycloak_openid_client_scope" "this" {
  realm_id               = var.realm_id
  name                   = var.scope_name
  description            = "${var.scope_name} idp client scope"
  include_in_token_scope = true
}

resource "keycloak_generic_protocol_mapper" "client_mappers" {
  for_each = toset(var.attributes)

  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.this.id

  name            = each.key
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "introspection.token.claim" : "true",
    "user.attribute" : each.key,
    "claim.name" : each.key,
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}
