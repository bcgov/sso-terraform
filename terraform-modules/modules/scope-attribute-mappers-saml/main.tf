resource "keycloak_saml_client_scope" "this" {
  realm_id    = var.realm_id
  name        = "${var.scope_name}-saml"
  description = "${var.scope_name} idp client scope"
}

resource "keycloak_generic_protocol_mapper" "client_mappers" {
  for_each = toset(var.attributes)

  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id

  name            = each.key
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"
  config = {
    "user.attribute" : each.key,
    "attribute.name" : each.key
  }
}
