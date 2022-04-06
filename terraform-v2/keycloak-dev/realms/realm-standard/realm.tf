module "realm" {
  source      = "../../../shared/realm"
  realm_name  = var.standard_realm_name
  login_theme = "bcgov-idp-stopper"
}

module "idp_auth_flow" {
  source   = "../../../shared/auth-browser-standard"
  realm_id = module.realm.id
}
