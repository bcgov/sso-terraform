
locals {
  privacy_zone_scopes = (
    var.bcsc_environment == "prod" ? var.prod_privacy_zone_scopes :
    var.bcsc_environment == "test" ? var.test_privacy_zone_scopes :
    var.sit_privacy_zone_scopes
  )
}

resource "keycloak_saml_client_scope" "this" {
  for_each = local.privacy_zone_scopes

  realm_id    = var.realm_id
  name        = "${each.key}-saml"
  description = "${each.value} client scope"
}

resource "keycloak_generic_protocol_mapper" "ppid_mapper" {
  for_each = keycloak_saml_client_scope.privacy_zone_scopes

  realm_id        = var.realm_id
  client_scope_id = each.value.id

  name            = "ppid"
  protocol        = "saml"
  protocol_mapper = "saml-idp-ppid-mapper"
  config = {
    "attribute.name" : "sub"
  }
}
