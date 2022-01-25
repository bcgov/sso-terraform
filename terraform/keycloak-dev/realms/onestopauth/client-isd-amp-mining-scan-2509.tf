module "client_isd-amp-mining-scan-2509" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "isd-amp-mining-scan-2509"
  valid_redirect_uris = [
    "https://sso.apps-isd.sd.gov.bc.ca/auth/realms/mining/broker/keycloak-oidc/endpoint"
  ]
  description = "CSS App Created"
}
