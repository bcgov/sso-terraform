module "client_coco-experiment-3367" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coco-experiment-3367"
  valid_redirect_uris = [
    "https://localhost:8080/app"
  ]
  description = "CSS App Created"
}
