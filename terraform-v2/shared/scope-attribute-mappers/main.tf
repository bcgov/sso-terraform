resource "keycloak_openid_client_scope" "scope" {
  realm_id               = var.realm_id
  name                   = var.scope_name
  description            = "${var.scope_name} idp client scope"
  include_in_token_scope = false
}

resource "keycloak_generic_client_protocol_mapper" "client_standard_mappers" {
  for_each = toset(var.attributes)

  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.scope.id

  name            = each.key
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : each.key,
    "claim.name" : each.key,
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}
