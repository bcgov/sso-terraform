module "name_scope_mappers" {
  source     = "../../scope-name-mappers"
  realm_id   = module.realm.id
  scope_name = "name"
}

module "common_scope_mappers" {
  source                           = "../../scope-common-mappers"
  realm_id                         = module.realm.id
  scope_name                       = "common"
  add_backwards_compatible_mappers = var.add_backwards_compatible_mappers
}

module "idir_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = var.idir_realm_name
  attributes = local.idir_attributes
}

module "azureidir_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = var.azureidir_realm_name
  attributes = local.azureidir_attributes
}

module "bceidbasic_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = var.bceidbasic_realm_name
  attributes = local.bceidbasic_attributes
}

module "bceidbusiness_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = var.bceidbusiness_realm_name
  attributes = local.bceidbusiness_attributes
}

module "bceidboth_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = var.bceidboth_realm_name
  attributes = local.bceidboth_attributes
}

module "digitalcredential_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = module.digitalcredential_idp.alias
  attributes = local.digitalcredential_attributes
}

module "githubpublic_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = "${var.github_realm_name}public"
  attributes = local.githubpublic_attributes
}

module "githubbcgov_scope_mappers" {
  source     = "../../scope-attribute-mappers"
  realm_id   = module.realm.id
  scope_name = "${var.github_realm_name}bcgov"
  attributes = local.githubbcgov_attributes
}
