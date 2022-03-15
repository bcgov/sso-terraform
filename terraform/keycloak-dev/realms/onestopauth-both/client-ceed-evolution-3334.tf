module "client_ceed-evolution-3334" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "ceed-evolution-3334"
  valid_redirect_uris = [
    "https://ceed-dev.crm3.dynamics.com"
  ]
  description = "CSS App Created"
}
