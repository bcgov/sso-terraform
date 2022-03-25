module "client_work-bc-career-compass-3136" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "work-bc-career-compass-3136"
  valid_redirect_uris = [
    "https://careerdiscoveryquizzes-test.workbc.ca/openid-connect/keycloak"
  ]
  description = "CSS App Created"
}
