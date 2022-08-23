module "client_ti-gr-s-3467" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "ti-gr-s-3467"
  client_name = "ti-gr-s-3467"
  valid_redirect_uris = [
    "https://bcmot.my.salesforce.com/services/authcallback/BCGovSSO"
  ]
  description = "CSS App Created"
}
