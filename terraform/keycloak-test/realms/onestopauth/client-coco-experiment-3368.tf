module "client_coco-experiment-3368" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coco-experiment-3368"
  valid_redirect_uris = [
    "http://localhost:8081/*",
    "http://localhost:8082/*",
    "https://localhost:8081/*",
    "https://localhost:8082/*"
  ]
  description = "CSS App Created"
}
