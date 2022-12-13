module "client_tidd-trade-industry-development-2575" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "tidd-trade-industry-development-2575"
  client_name = "tidd-trade-industry-development-2575"
  valid_redirect_uris = [
    "https://tradeandinvestbc.my.salesforce.com/"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://tradeandinvestbc.my.salesforce.com/",
    "+"
  ]
}
