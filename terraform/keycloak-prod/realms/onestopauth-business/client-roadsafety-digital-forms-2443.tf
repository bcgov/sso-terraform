module "client_roadsafety-digital-forms-2443" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "roadsafety-digital-forms-2443"
  client_name = "roadsafety-digital-forms-2443"
  valid_redirect_uris = [
    "https://jag.gov.bc.ca/roadside-forms/*"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://jag.gov.bc.ca/roadside-forms/*",
    "+"
  ]
}
