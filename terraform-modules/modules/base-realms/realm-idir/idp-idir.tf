# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/saml_identity_provider
module "idir_idp" {
  source                     = "../../saml-idp"
  realm_id                   = module.realm.id
  alias                      = var.realm_name
  entity_id                  = var.saml_entity_id
  single_sign_on_service_url = var.single_sign_on_service_url
  signing_certificate        = var.signing_certificate
  validate_signature         = var.validate_signature
}

resource "keycloak_custom_identity_provider_mapper" "idir_firstname" {
  realm                    = module.realm.id
  name                     = "first_name"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "first_name"
    "user.attribute" = "firstName"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_lastname" {
  realm                    = module.realm.id
  name                     = "last_name"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "last_name"
    "user.attribute" = "lastName"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "display_name"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_email" {
  realm                    = module.realm.id
  name                     = "email"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "email"
    "user.attribute" = "email"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_idir_user_guid" {
  realm                    = module.realm.id
  name                     = "idir_user_guid"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "idir_user_guid"
    "user.attribute" = "idir_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "idir_idir_username" {
  realm                    = module.realm.id
  name                     = "idir_username"
  identity_provider_alias  = module.idir_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "idir_username"
    "user.attribute" = "idir_username"
  }
}

# resource "keycloak_custom_identity_provider_mapper" "idir_username" {
#   realm                    = module.realm.id
#   name                     = "username"
#   identity_provider_alias  = module.idir_idp.alias
#   identity_provider_mapper = "saml-username-idp-mapper"

#   extra_config = {
#     syncMode = "INHERIT"
#     template = "$${ATTRIBUTE.username}"
#   }
# }
