module "client_bcea-forecast-confidential-2212" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "bcea-forecast-confidential-2212"
  valid_redirect_uris = [
    "http://localhost:3000/*"
  ]
  description = "CSS App Created"
}
