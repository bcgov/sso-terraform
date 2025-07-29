module "sandbox_client" {
  source                    = "../../sandbox-idp-client-saml"
  realm_id                  = module.realm.id
  client_id                 = "sandbox-client"
  valid_redirect_uris       = [var.sandbox_client_redirect_uri]
  attributes                = ["display_name", "bceid_user_guid", "bceid_business_guid", "bceid_business_name", "bceid_username"]
  client_signature_required = false
  encrypt_assertions        = false
}

resource "keycloak_generic_protocol_mapper" "smgov_bceid_business_guid_mapper" {
  realm_id  = module.realm.id
  client_id = module.sandbox_client.id

  name            = "smgov_bceid_business_guid"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"
  config = {
    "attribute.name"       = "SMGOV_BUSINESSGUID"
    "attribute.nameformat" = "Basic"
    "user.attribute"       = "bceid_business_guid"
  }
}

resource "keycloak_generic_protocol_mapper" "smgov_bceid_business_name_mapper" {
  realm_id  = module.realm.id
  client_id = module.sandbox_client.id

  name            = "smgov_bceid_business_name"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"
  config = {
    "attribute.name"       = "SMGOV_BUSINESSLEGALNAME"
    "attribute.nameformat" = "Basic"
    "user.attribute"       = "bceid_business_name"
  }
}
