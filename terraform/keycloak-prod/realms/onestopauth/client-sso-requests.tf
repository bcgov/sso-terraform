module "client_sso-requests" {
  source = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"

  realm_id                   = data.keycloak_realm.this.id
  client_name                = "sso-requests"
  access_type                = "PUBLIC"
  valid_redirect_uris        = ["https://bcgov.github.io/sso-requests"]
  web_origins                = ["+"]
  pkce_code_challenge_method = "S256"
  roles                      = ["sso-admin", "bceid-approver"]
  description                = "System Default"
}
