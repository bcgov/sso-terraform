module "client_bc-public-service-agency-bi-3670" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "bc-public-service-agency-bi-3670"
  client_name = "bc-public-service-agency-bi-3670"
  valid_redirect_uris = [
    "https://localhost:9595/*"
  ]
  description = "CSS App Created"
}
