module "client_sso-gold-2542" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "sso-gold-2542"
  valid_redirect_uris = [
    "https://dev.loginproxy.gov.bc.ca/auth/realms/silveridir/broker/silveridir/endpoint",
    "https://sso-keycloak-c6af30-dev.apps.gold.devops.gov.bc.ca/auth/realms/onestopauth/broker/idir-silver/endpoint"
  ]
  description = "CSS App Created"
}
