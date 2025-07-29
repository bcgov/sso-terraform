resource "keycloak_generic_protocol_mapper" "this" {
  for_each = toset(var.attributes)

  realm_id  = var.realm_id
  client_id = var.client_id

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
