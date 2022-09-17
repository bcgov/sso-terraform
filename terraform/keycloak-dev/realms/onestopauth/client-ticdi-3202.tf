module "client_ticdi-3202" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "ticdi-3202"
  client_name = "ticdi-3202"
  valid_redirect_uris = [
    "*"
  ]
  description = "CSS App Created"
}
