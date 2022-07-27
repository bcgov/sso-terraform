module "client_awp-prd-idir-only-3634" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "awp-prd-idir-only-3634"
  client_name = "awp-prd-idir-only-3634"
  valid_redirect_uris = [
    "https://NOT-USED-awp.th.gov.bc.ca"
  ]
  description = "CSS App Created"
}
