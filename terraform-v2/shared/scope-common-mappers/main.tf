resource "keycloak_openid_client_scope" "scope" {
  realm_id               = var.realm_id
  name                   = var.scope_name
  description            = "${var.scope_name} client scope"
  include_in_token_scope = false
}

resource "keycloak_generic_client_protocol_mapper" "identity_provider_mapper" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.scope.id
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
