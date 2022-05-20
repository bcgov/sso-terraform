module "client_bceidplay-3701" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bceidplay-3701"
  valid_redirect_uris = [
    "https://bceid-dev.solnspace.com"
  ]
  description = "CSS App Created"
}
