module "client_awp-2146" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "awp-2146"
  valid_redirect_uris = [
    "https://dev-awp.th.gov.bc.ca/"
  ]
  description = "CSS App Created"
}
