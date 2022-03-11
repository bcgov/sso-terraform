module "client_tidd-salesforce-2707" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tidd-salesforce-2707"
  valid_redirect_uris = [
    "https://tradeandinvestbc--test.my.salesforce.com/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://tradeandinvestbc--test.my.salesforce.com/",
    "+"
  ]
}
