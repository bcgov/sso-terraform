module "client_jsb-csrs-991" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "jsb-csrs-991"
  valid_redirect_uris = [
    "https://localhost:8080"
  ]
  description = "CSS App Created"
}
