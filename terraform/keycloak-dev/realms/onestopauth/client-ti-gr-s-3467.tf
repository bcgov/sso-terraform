module "client_ti-gr-s-3467" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "ti-gr-s-3467"
  client_name = "ti-gr-s-3467"
  valid_redirect_uris = [
    "http://localhost:8000/auth/cb/bcgovidir/",
    "http://localhost:8000/auth/cb/keycloak/",
    "https://bcmot--dev.sandbox.my.salesforce.com/services/authcallback/BCGovSSO",
    "https://bcmot--dev2.my.salesforce.com/services/authcallback/BCGovSSO"
  ]
  description = "CSS App Created"
}
