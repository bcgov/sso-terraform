module "common_scope_mappers_saml" {
  source     = "../../scope-common-mappers-saml"
  realm_id   = module.realm.id
  scope_name = "common"
}

module "idir_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = var.idir_realm_name
  attributes = local.idir_attributes
}

module "azureidir_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = var.azureidir_realm_name
  attributes = local.azureidir_attributes
}

module "bceidbasic_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = var.bceidbasic_realm_name
  attributes = local.bceidbasic_attributes
}

module "bceidbusiness_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = var.bceidbusiness_realm_name
  attributes = local.bceidbusiness_attributes
}

module "bceidboth_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = var.bceidboth_realm_name
  attributes = local.bceidboth_attributes
}

module "githubpublic_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = "${var.github_realm_name}public"
  attributes = local.githubpublic_attributes
}

module "githubbcgov_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = "${var.github_realm_name}bcgov"
  attributes = local.githubbcgov_attributes
}

module "digitalcredential_scope_mappers_saml" {
  source     = "../../scope-attribute-mappers-saml"
  realm_id   = module.realm.id
  scope_name = module.digitalcredential_idp.alias
  attributes = local.digitalcredential_attributes
}
