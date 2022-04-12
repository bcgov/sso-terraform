module "realm" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/realm"
  realm_name  = var.standard_realm_name
  login_theme = "bcgov-idp-stopper"
}

module "idp_auth_flow" {
  source   = "github.com/bcgov/sso-terraform-modules?ref=main/modules/idp-stopper-auth-flow"
  realm_id = module.realm.id
}
