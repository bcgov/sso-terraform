module "client_work-bc-career-compass-3136" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "work-bc-career-compass-3136"
  valid_redirect_uris = [
    "https://careerdiscoveryquizzes-dev/openid-connect/*"
  ]
  description = "CSS App Created"
}
