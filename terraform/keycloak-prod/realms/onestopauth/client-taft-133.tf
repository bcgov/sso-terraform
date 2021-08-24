module "client_taft-133" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "taft-133"
  valid_redirect_uris = [
    "https://idm-prod-taft.apps.silver.devops.gov.bc.ca/auth/realms/taft/broker/idir/endpoint"
  ]
}
