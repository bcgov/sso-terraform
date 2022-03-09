module "client_serve-legal-documents-3070" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "serve-legal-documents-3070"
  valid_redirect_uris = [
    "https://keycloak-a60371-test.apps.silver.devops.gov.bc.ca/auth/realms/forms-flow-ai/broker/keycloak-oidc/endpoint"
  ]
  description = "CSS App Created"
}
