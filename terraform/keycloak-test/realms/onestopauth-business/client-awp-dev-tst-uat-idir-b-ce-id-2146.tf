module "client_awp-dev-tst-uat-idir-b-ce-id-2146" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "awp-dev-tst-uat-idir-b-ce-id-2146"
  valid_redirect_uris = [
    "https://rft-awp.th.gov.bc.ca/*",
    "https://tst-awp.th.gov.bc.ca/*",
    "https://uat-awp.th.gov.bc.ca/*"
  ]
  description = "CSS App Created"
}
