module "client_office-of-the-superintendent-of-prof-governance-3071" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "office-of-the-superintendent-of-prof-governance-3071"
  valid_redirect_uris = [
    "https://keycloak-e63731-prod.apps.silver.devops.gov.bc.ca/auth/realms/forms-flow-ai/broker/keycloak-oidc/endpoint"
  ]
  description = "CSS App Created"
}
