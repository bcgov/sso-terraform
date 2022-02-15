module "client_greenfield-template-2938" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "greenfield-template-2938"
  valid_redirect_uris = [
    "https://tbd"
  ]
  description = "CSS App Created"
}
