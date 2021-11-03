module "client_ux-testing-session-2021-11-03-925" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "ux-testing-session-2021-11-03-925"
  valid_redirect_uris = [
    "https://manateedriveintheatre.gov.bc.ca"
  ]
  description = "CSS App Created"
}
