# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/saml_identity_provider
resource "keycloak_saml_identity_provider" "bceidbasic" {
  realm        = module.realm.id
  alias        = var.realm_name
  display_name = var.realm_name

  enabled     = true
  store_token = false
  trust_email = false
  sync_mode   = "IMPORT"

  entity_id                  = "${var.keycloak_url}/auth/realms/${var.realm_name}"
  single_sign_on_service_url = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
  single_logout_service_url  = ""

  name_id_policy_format = "Persistent"
  principal_type        = "SUBJECT"

  backchannel_supported      = false
  post_binding_response      = true
  post_binding_authn_request = true
  post_binding_logout        = false

  force_authn         = true
  validate_signature  = true
  signing_certificate = "<UPDATE_ME>"

  extra_config = {
    "authnContextComparisonType" = "exact"
  }

  lifecycle {
    ignore_changes = [
      signing_certificate,
    ]
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidbasic_displayname" {
  realm                    = module.realm.id
  name                     = "display_name"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidbasic.alias
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
  identity_provider_alias  = keycloak_saml_identity_provider.bceidbasic.alias
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
  identity_provider_alias  = keycloak_saml_identity_provider.bceidbasic.alias
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
  identity_provider_alias  = keycloak_saml_identity_provider.bceidbasic.alias
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
#   identity_provider_alias  = keycloak_saml_identity_provider.bceidbasic.alias
#   identity_provider_mapper = "saml-username-idp-mapper"

#   extra_config = {
#     syncMode = "INHERIT"
#     template = "$${ATTRIBUTE.username}"
#   }
# }
