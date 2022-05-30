module "client_conn-ccbc-portal-3700" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "conn-ccbc-portal-3700"
  valid_redirect_uris = [
    "http://localhost:3000/dashboard",
    "https://ccbc-dev.apps.silver.devops.gov.bc.ca/dashboard"
  ]
  description = "CSS App Created"
}
