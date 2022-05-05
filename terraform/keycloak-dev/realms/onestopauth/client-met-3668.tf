module "client_met-3668" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "met-3668"
  valid_redirect_uris = [
    "https://met-oidc-dev.apps.gold.devops.gov.bc.ca/auth/realms/met/broker/idir/endpoint"
  ]
  description = "CSS App Created"
}
