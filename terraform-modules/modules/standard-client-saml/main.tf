module "standard_saml_client" {
  source = "../saml-client"

  realm_id = var.realm_id

  client_id   = var.client_id
  name        = var.client_name
  description = var.description
  login_theme = var.login_theme

  enabled = var.enabled

  valid_redirect_uris = var.valid_redirect_uris
  assertion_lifespan  = var.assertion_lifespan

  override_authentication_flow    = var.override_authentication_flow
  browser_authentication_flow     = var.browser_authentication_flow
  logout_service_post_binding_url = var.logout_post_binding_url

  sign_assertions = var.sign_assertions
}

# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/role
resource "keycloak_role" "client_role" {
  for_each = { for v in var.roles : v => v }

  realm_id    = var.realm_id
  client_id   = module.standard_saml_client.id
  name        = each.value
  description = each.value
}

resource "keycloak_saml_client_default_scopes" "idp_scopes" {
  realm_id  = var.realm_id
  client_id = module.standard_saml_client.id

  default_scopes = [for v in var.idps : "${v}-saml"]
}

resource "keycloak_generic_protocol_mapper" "additional_client_roles" {
  count           = var.additional_role_attribute != "" ? 1 : 0
  realm_id        = var.realm_id
  client_id       = module.standard_saml_client.id
  name            = "additional_client_roles"
  protocol        = "saml"
  protocol_mapper = "saml-client-role-list-mapper"
  config = {
    "attribute.name" : var.additional_role_attribute,
    "single" : "true"
  }
}

resource "keycloak_role" "realm_role" {
  realm_id    = var.realm_id
  name        = "client-${module.standard_saml_client.client_id}"
  description = "Role for client: ${module.standard_saml_client.client_id}"
}
