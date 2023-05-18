module "client_realm-profile-app-760" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "realm-profile-app-760"
  client_name = "realm-profile-app-760"
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:8000/*",
    "http://localhost:8080/*",
    "http://localhost:8081/*",
    "http://localhost:8089/*",
    "http://realm-registry-b861c7-dev.apps.silver.devops.gov.bc.ca/*",
    "http://realm-registry-dev.apps.silver.devops.gov.bc.ca/*",
    "http://realm-registry.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
