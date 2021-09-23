module "client_sprint-demo-562" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sprint-demo-562"
  valid_redirect_uris = [
    "http://localhost:3000"
  ]
}
