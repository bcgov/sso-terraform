module "client_met-3668" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "met-3668"
  client_name = "met-3668"
  valid_redirect_uris = [
    "https://met-oidc.apps.gold.devops.gov.bc.ca/auth/realms/met/broker/idir/endpoint",
    "https://met-oidc.apps.gold.devops.gov.bc.ca/auth/realms/met/broker/idir/endpoint/logout_response"
  ]
  description = "CSS App Created"
}
