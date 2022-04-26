module "client_slam-3637" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "slam-3637"
  valid_redirect_uris = [
    "https://citz-imb-slam-ca94a8-dev.apps.silver.devops.gov.bc.ca/"
  ]
  description = "CSS App Created"
}
