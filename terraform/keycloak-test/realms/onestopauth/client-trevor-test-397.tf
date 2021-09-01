module "client_trevor-test-397" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "trevor-test-397"
  valid_redirect_uris = [
    "https://fmdbt.hlth.gov.bc.ca"
  ]
}
