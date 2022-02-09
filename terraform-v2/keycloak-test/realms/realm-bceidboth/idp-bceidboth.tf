# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/saml_identity_provider
resource "keycloak_saml_identity_provider" "bceidboth" {
  realm        = keycloak_realm.this.id
  alias        = var.realm_name
  display_name = var.realm_name

  enabled     = true
  store_token = false
  trust_email = false
  sync_mode   = "IMPORT"

  entity_id                  = "${var.keycloak_url}/auth/realms/${var.realm_name}"
  single_sign_on_service_url = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
  single_logout_service_url  = ""

  name_id_policy_format = "urn:oasis:names:tc:SAML:2.0:nameid-format:persistent"
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

resource "keycloak_custom_identity_provider_mapper" "bceidboth_displayname" {
  realm                    = keycloak_realm.this.id
  name                     = "display_name"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "displayname"
    "user.attribute" = "display_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_email" {
  realm                    = keycloak_realm.this.id
  name                     = "email"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "email"
    "user.attribute" = "email"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_guid1" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_user_guid1"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "useridentifier"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_guid2" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_user_guid2"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_USERGUID"
    "user.attribute" = "bceid_user_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_user_name" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_user_name"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_USERDISPLAYNAME"
    "user.attribute" = "bceid_user_name"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_guid" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_business_guid"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_BUSINESSGUID"
    "user.attribute" = "bceid_business_guid"
  }
}

resource "keycloak_custom_identity_provider_mapper" "bceidboth_bceid_business_name" {
  realm                    = keycloak_realm.this.id
  name                     = "bceid_business_name"
  identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
  identity_provider_mapper = "saml-user-attribute-idp-mapper"

  extra_config = {
    syncMode         = "INHERIT"
    "attribute.name" = "SMGOV_BUSINESSLEGALNAME"
    "user.attribute" = "bceid_business_name"
  }
}

# resource "keycloak_custom_identity_provider_mapper" "bceidboth_username" {
#   realm                    = keycloak_realm.this.id
#   name                     = "username"
#   identity_provider_alias  = keycloak_saml_identity_provider.bceidboth.alias
#   identity_provider_mapper = "saml-username-idp-mapper"

#   extra_config = {
#     syncMode = "INHERIT"
#     template = "$${ATTRIBUTE.username}"
#   }
# }
