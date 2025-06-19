resource "keycloak_custom_identity_provider_mapper" "this" {
  for_each = toset(var.attributes)

  realm                    = var.realm_id
  name                     = each.key
  identity_provider_alias  = var.idp_alias
  identity_provider_mapper = "oidc-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "claim"          = each.key
    "user.attribute" = each.key
  }
}
