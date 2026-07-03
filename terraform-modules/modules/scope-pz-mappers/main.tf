
locals {
  privacy_zone_scopes = (
    var.bcsc_environment == "prod" ? var.prod_privacy_zone_scopes :
    var.bcsc_environment == "test" ? var.test_privacy_zone_scopes :
    var.sit_privacy_zone_scopes
  )
}


resource "keycloak_openid_client_scope" "privacy_zone_scopes" {
  for_each = local.privacy_zone_scopes

  realm_id = var.realm_id

  name        = each.key
  description = each.value
}

resource "keycloak_generic_protocol_mapper" "ppid_mapper" {
  for_each = keycloak_openid_client_scope.privacy_zone_scopes

  realm_id        = var.realm_id
  client_scope_id = each.value.id
  name            = "ppid"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-idp-ppid-mapper"
  config = {
    "access.token.claim"        = "true"
    "claim.name"                = "sub"
    "id.token.claim"            = "true"
    "introspection.token.claim" = "true"
    "lightweight.claim"         = "false"
    "userinfo.token.claim"      = "true"
  }
}
