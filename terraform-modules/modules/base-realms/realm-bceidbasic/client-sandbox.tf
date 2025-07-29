module "sandbox_client" {
  source                    = "../../sandbox-idp-client-saml"
  realm_id                  = module.realm.id
  client_id                 = "sandbox-client"
  valid_redirect_uris       = [var.sandbox_client_redirect_uri]
  attributes                = ["display_name", "bceid_user_guid", "bceid_username"]
  client_signature_required = false
  encrypt_assertions        = false
}
