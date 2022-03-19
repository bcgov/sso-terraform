module "common_scope_mappers" {
  source     = "../../../shared/scope-common-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = "common"
}

module "idir_scope_mappers" {
  source     = "../../../shared/scope-attribute-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = var.idir_realm_name
  attributes = ["display_name", "idir_user_guid", "idir_username"]
}

module "azureidir_scope_mappers" {
  source     = "../../../shared/scope-attribute-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = var.azureidir_realm_name
  attributes = ["display_name", "idir_user_guid", "idir_username"]
}

module "bceidbasic_scope_mappers" {
  source     = "../../../shared/scope-attribute-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = var.bceidbasic_realm_name
  attributes = ["display_name", "bceid_user_guid"]
}

module "bceidbusiness_scope_mappers" {
  source     = "../../../shared/scope-attribute-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = var.bceidbusiness_realm_name
  attributes = ["display_name", "bceid_user_guid", "bceid_user_name", "bceid_business_guid", "bceid_business_name"]
}

module "bceidboth_scope_mappers" {
  source     = "../../../shared/scope-attribute-mappers"
  realm_id   = keycloak_realm.this.id
  scope_name = var.bceidboth_realm_name
  attributes = ["display_name", "bceid_user_guid", "bceid_user_name", "bceid_business_guid", "bceid_business_name"]
}
