module "client_cloud-pathfinder-aws-zl-0-893" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "cloud-pathfinder-aws-zl-0-893"
  valid_redirect_uris = [
    "http://localhost:5000"
  ]
  description = "CSS App Created"
}
