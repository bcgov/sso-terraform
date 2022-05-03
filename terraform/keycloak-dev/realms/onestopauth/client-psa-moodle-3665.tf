module "client_psa-moodle-3665" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "psa-moodle-3665"
  valid_redirect_uris = [
    "https://moodle-950003-dev.apps.silver.devops.gov.bc.ca/admin/oauth2callback.php",
    "https://moodle.virtuallearn.ca/admin/oauth2callback.php"
  ]
  description                = "CSS App Created"
  access_type                = "PUBLIC"
  pkce_code_challenge_method = "S256"
  web_origins = [
    "https://moodle-950003-dev.apps.silver.devops.gov.bc.ca/admin/oauth2callback.php",
    "https://moodle.virtuallearn.ca/admin/oauth2callback.php",
    "+"
  ]
}
