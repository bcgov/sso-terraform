locals {
  idp_public_attrs = ["display_name", "idir_user_guid", "idir_username"]
}

resource "keycloak_openid_client" "standard" {
  realm_id = module.realm.id

  client_id = var.standard_realm_name
  name      = var.standard_realm_name

  enabled                      = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type = "CONFIDENTIAL"

  valid_redirect_uris = ["${var.keycloak_url}/auth/realms/${var.standard_realm_name}/broker/${var.realm_name}/endpoint"]
  web_origins         = []
}

module "standard_client_mappers" {
  source    = "../../../shared/client-attribute-mappers"
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.standard.id

  attributes = local.idp_public_attrs
}

resource "keycloak_openid_client_default_scopes" "client_standard_default_scopes" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.standard.id

  default_scopes = [
    "profile",
    "email",
    keycloak_openid_client_scope.idp_scope.name,
  ]
}
