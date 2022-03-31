module "client_ti-gr-s-3467" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "ti-gr-s-3467"
  valid_redirect_uris = [
    "https://bcmot--dev.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
  description = "CSS App Created"
}
