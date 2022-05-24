module "client_fam-3702" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "fam-3702"
  valid_redirect_uris = [
    "https://oidcdebuggersecure-3d5c3f-dev.apps.silver.devops.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
