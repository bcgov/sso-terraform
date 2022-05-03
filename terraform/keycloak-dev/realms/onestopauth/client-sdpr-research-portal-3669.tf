module "client_sdpr-research-portal-3669" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sdpr-research-portal-3669"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://research-portal-ba7244-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
