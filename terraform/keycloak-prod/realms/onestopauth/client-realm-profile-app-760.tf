module "client_realm-profile-app-760" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "realm-profile-app-760"
  client_name = "realm-profile-app-760"
  valid_redirect_uris = [
    "http://realm-registry.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
