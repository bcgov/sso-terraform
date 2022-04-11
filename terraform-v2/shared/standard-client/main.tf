resource "keycloak_openid_client" "this" {
  realm_id = var.realm_id

  client_id = var.client_id
  name      = var.client_id

  enabled                      = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type = "CONFIDENTIAL"

  valid_redirect_uris = var.valid_redirect_uris
  web_origins         = []
}

module "client_mappers" {
  source    = "../client-attribute-mappers"
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.this.id

  attributes = var.public_attrs
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.this.id

  default_scopes = [
    "profile",
    "email",
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.this.id

  optional_scopes = [
    "offline_access",
  ]
}
