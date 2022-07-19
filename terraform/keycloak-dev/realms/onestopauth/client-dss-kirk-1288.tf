module "client_dss-kirk-1288" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "dss-kirk-1288"
  client_name = "dss-kirk-1288"
  valid_redirect_uris = [
    "https://kirk-d.data.gov.bc.ca/"
  ]
  description = "CSS App Created"
}
