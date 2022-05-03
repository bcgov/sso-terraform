module "client_sdpr-research-portal-3669" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sdpr-research-portal-3669"
  valid_redirect_uris = [
    "https://research-portal-ba7244-test.apps.silver.devops.gov.bc.ca/"
  ]
  description = "CSS App Created"
}
