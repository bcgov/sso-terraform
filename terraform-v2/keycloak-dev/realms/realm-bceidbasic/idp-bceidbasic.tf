# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/saml_identity_provider

module "bceidbasic_idp" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/saml-idp"
  realm_id                   = module.realm.id
  alias                      = var.realm_name
  entity_id                  = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbasic/"
  single_sign_on_service_url = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
  signing_certificate        = var.signing_certificate
}

resource "keycloak_custom_identity_provider_mapper" "bceidbasic_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = module.bceidbasic_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "displayName"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbasic_email" {
  realm                    = module.realm.id
  name                     = "email"
  identity_provider_alias  = module.bceidbasic_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "email"
    "user.attribute" = "email"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbasic_bceid_user_guid" {
  realm                    = module.realm.id
  name                     = "bceid_user_guid"
  identity_provider_alias  = module.bceidbasic_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "useridentifier"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbasic_bceid_username" {
  realm                    = module.realm.id
  name                     = "bceid_username"
  identity_provider_alias  = module.bceidbasic_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "username"
    "user.attribute" = "bceid_username"
  }
}

# resource "keycloak_custom_identity_provider_mapper" "bceidbasic_username" {
#   realm                    = module.realm.id
#   name                     = "username"
#   identity_provider_alias  = module.bceidbasic_idp.alias
#   identity_provider_mapper = "saml-username-idp-mapper"

#   extra_config = {
#     syncMode = "INHERIT"
#     template = "$${ATTRIBUTE.username}"
#   }
# }
