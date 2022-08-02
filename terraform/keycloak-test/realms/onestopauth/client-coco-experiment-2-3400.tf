module "client_coco-experiment-2-3400" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "coco-experiment-2-3400"
  client_name = "coco-experiment-2-3400"
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "http://localhost:8080/app"
  ]
  description = "CSS App Created"
}
