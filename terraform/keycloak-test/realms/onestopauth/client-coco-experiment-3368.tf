module "client_coco-experiment-3368" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coco-experiment-3368"
  valid_redirect_uris = [
    "http://localhost:8082/app/"
  ]
  description = "CSS App Created"
}
