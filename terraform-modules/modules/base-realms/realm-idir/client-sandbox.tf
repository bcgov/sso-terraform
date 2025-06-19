module "sandbox_client" {
  source                    = "../../sandbox-idp-client-saml"
  realm_id                  = module.realm.id
  client_id                 = "sandbox-client"
  valid_redirect_uris       = [var.sandbox_client_redirect_uri]
  attributes                = ["display_name", "idir_user_guid", "idir_username"]
  client_signature_required = false
  encrypt_assertions        = false
}

resource "keycloak_generic_protocol_mapper" "last_name_property_mapper" {

  realm_id  = module.realm.id
  client_id = module.sandbox_client.id

  name            = "last_name"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"
  config = {
    "attribute.name" = "last_name"
    "user.attribute" = "lastName"
  }
}

resource "keycloak_generic_protocol_mapper" "first_name_property_mapper" {

  realm_id  = module.realm.id
  client_id = module.sandbox_client.id

  name            = "first_name"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"
  config = {
    "attribute.name" = "first_name"
    "user.attribute" = "firstName"
  }
}
