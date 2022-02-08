module "client_coms-showcase-2806" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "coms-showcase-2806"
  valid_redirect_uris = [
    "http://localhost:8080",
    "http://localhost:8081"
  ]
  description = "CSS App Created"
}
