module "client_traffic-courts-online-3499" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "traffic-courts-online-3499"
  client_name = "traffic-courts-online-3499"
  valid_redirect_uris = [
    "https://oidc-0198bb-dev.apps.silver.devops.gov.bc.ca/",
    "https://staff-web-0198bb-dev.apps.silver.devops.gov.bc.ca"
  ]
  description = "CSS App Created"
}
