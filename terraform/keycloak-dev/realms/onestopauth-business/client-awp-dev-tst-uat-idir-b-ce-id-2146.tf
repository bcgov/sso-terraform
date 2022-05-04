module "client_awp-dev-tst-uat-idir-b-ce-id-2146" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "awp-dev-tst-uat-idir-b-ce-id-2146"
  valid_redirect_uris = [
    "https://dev-awp.th.gov.bc.ca/*",
    "https://localhost:44317/*",
    "https://localhost:44341/*"
  ]
  description = "CSS App Created"
}
