resource "keycloak_saml_client_scope" "this" {
  realm_id    = var.realm_id
  name        = "${var.scope_name}-saml"
  description = "${var.scope_name} client scope"
}

resource "keycloak_generic_protocol_mapper" "email" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id

  name            = "email"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"
  config = {
    "user.attribute" : "email",
    "attribute.name" : "email"
  }
}

resource "keycloak_generic_protocol_mapper" "given_name" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id

  name            = "given_name"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"
  config = {
    "user.attribute" : "firstName",
    "attribute.name" : "given_name"
  }
}

resource "keycloak_generic_protocol_mapper" "family_name" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id

  name            = "family_name"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"
  config = {
    "user.attribute" : "lastName",
    "attribute.name" : "family_name"
  }
}

resource "keycloak_generic_protocol_mapper" "identity_provider" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id

  name            = "IDP"
  protocol        = "saml"
  protocol_mapper = "saml-user-session-note-mapper"
  config = {
    "note" : "identity_provider",
    "attribute.name" : "identity_provider"
  }
}

resource "keycloak_generic_protocol_mapper" "nameid" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id
  name            = "nameid_username"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-nameid-mapper"
  config = {
    "mapper.nameid.format" : "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent",
    "user.attribute" : "username"
  }
}

resource "keycloak_generic_protocol_mapper" "client_roles" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id
  name            = "client_roles"
  protocol        = "saml"
  protocol_mapper = "saml-client-role-list-mapper"
  config = {
    "attribute.name" : "client_roles",
    "single" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "statement_attribute_omitter" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_saml_client_scope.this.id
  name            = "statement_attribute_omitter"
  protocol        = "saml"
  protocol_mapper = "saml-omit-statement-attributes-by-idp-mapper"
  config = {
    "identity_provider_aliases" : "bceidbasic bceidbusiness bceidboth githubpublic githubbcgov",
    "statement_attribute_names" : "family_name",
  }
}
