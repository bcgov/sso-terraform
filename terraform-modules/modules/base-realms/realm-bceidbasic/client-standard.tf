module "standard_client" {
  source              = "../../standard-idp-client"
  realm_id            = module.realm.id
  client_id           = "${var.standard_realm_name}-realm"
  valid_redirect_uris = ["${var.keycloak_url}/auth/realms/${var.standard_realm_name}/broker/${var.realm_name}/endpoint"]
  public_attrs        = ["display_name", "bceid_user_guid", "bceid_username"]
  sub_to_username     = var.sub_to_username
}
