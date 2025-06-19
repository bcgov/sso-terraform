resource "keycloak_openid_client" "azureidir_sandbox_client" {
  realm_id = module.realm.id

  client_id = "sandbox-client"
  name      = "sandbox-client"

  enabled                      = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type = "CONFIDENTIAL"

  valid_redirect_uris = [var.sandbox_client_redirect_uri]
  web_origins         = []
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_samaccountname" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "samaccountname"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "idir_username",
    "claim.name" : "samaccountname",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_given_name" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "given_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "firstName",
    "claim.name" : "given_name",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_family_name" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "family_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "lastName",
    "claim.name" : "family_name",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_display_name" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "display_name",
    "claim.name" : "name",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_bcgovguid" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "bcgovGUID"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "idir_user_guid",
    "claim.name" : "bcgovGUID",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "sandbox_client_mapper_userprincipalname" {

  realm_id  = module.realm.id
  client_id = keycloak_openid_client.azureidir_sandbox_client.id

  name            = "user_principal_name"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "user.attribute" : "user_principal_name",
    "claim.name" : "upn",
    "jsonType.label" : "String",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}
