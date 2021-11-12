module "client_tti-poc-public-1189" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tti-poc-public-1189"
  valid_redirect_uris = [
    "https://civilresolutionbc--demo02.my.salesforce.com/services/authcallback/PathfinderSSO",
    "https://civilresolutionbc--springdev.my.salesforce.com/services/authcallback/PathfinderSSO",
    "https://civilresolutionbc--springdev.my.salesforce.com/services/authcallback/PathfinderSSOPublic"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "+"
  ]
}
