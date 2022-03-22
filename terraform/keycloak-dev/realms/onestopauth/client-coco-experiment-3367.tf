module "client_coco-experiment-3367" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coco-experiment-3367"
  valid_redirect_uris = [
    "http://localhost:8080/app/",
    "http://localhost:8081/app/",
    "http://localhost:8082",
    "http://localhost:8082/",
    "http://localhost:8082/app",
    "http://localhost:8082/app/",
    "http://localhost:8083/app/",
    "http://localhost:8084/app/",
    "http://localhost:8085/app/",
    "https://www.google.com/"
  ]
  description = "CSS App Created"
}
