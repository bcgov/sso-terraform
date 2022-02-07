module "client_psa-moodle-2773" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "psa-moodle-2773"
  valid_redirect_uris = [
    "https://moodle-950003-test.apps.silver.devops.gov.bc.ca/admin/oauth2callback.php"
  ]
  description = "CSS App Created"
}
