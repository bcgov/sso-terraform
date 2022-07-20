module "client_slam-3637" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "slam-3637"
  client_name = "slam-3637"
  valid_redirect_uris = [
    "https://test.slam.im.gov.bc.ca"
  ]
  description = "CSS App Created"
}
