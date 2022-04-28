# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/saml_identity_provider
module "bceidboth_idp" {
  source                     = "github.com/bcgov/sso-terraform-modules?ref=main/modules/saml-idp"
  realm_id                   = module.realm.id
  alias                      = var.realm_name
  entity_id                  = "https://loginproxy.gov.bc.ca/auth/realms/_bceidbasicbusiness/"
  single_sign_on_service_url = "https://sfs7.gov.bc.ca/affwebservices/public/saml2sso"
  signing_certificate        = var.signing_certificate
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "displayName"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_email" {
  realm                    = module.realm.id
  name                     = "email"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "email"
    "user.attribute" = "email"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_guid" {
  realm                    = module.realm.id
  name                     = "bceid_user_guid"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "useridentifier"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_username" {
  realm                    = module.realm.id
  name                     = "bceid_username"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "username"
    "user.attribute" = "bceid_username"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_guid" {
  realm                    = module.realm.id
  name                     = "bceid_business_guid"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_BUSINESSGUID"
    "user.attribute" = "bceid_business_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_name" {
  realm                    = module.realm.id
  name                     = "bceid_business_name"
  identity_provider_alias  = module.bceidboth_idp.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_BUSINESSLEGALNAME"
    "user.attribute" = "bceid_business_name"
  }
}

# resource "keycloak_custom_identity_provider_mapper" "bceidboth_username" {
#   realm                    = module.realm.id
#   name                     = "username"
#   identity_provider_alias  = module.bceidboth_idp.alias
#   identity_provider_mapper = "saml-username-idp-mapper"

#   extra_config = {
#     syncMode = "INHERIT"
#     template = "$${ATTRIBUTE.username}"
#   }
# }
