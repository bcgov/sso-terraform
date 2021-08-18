module "client_taft-133" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "taft-133"
  valid_redirect_uris = [
    "https://idm-test-taft.apps.silver.devops.gov.bc.ca/auth/realms/taft/broker/idir/endpoint",
    "https://localhost:8080/auth/realms/taft/broker/idir/endpoint"
  ]
}
