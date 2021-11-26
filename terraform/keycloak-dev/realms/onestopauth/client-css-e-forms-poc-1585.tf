module "client_css-e-forms-poc-1585" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "css-e-forms-poc-1585"
  valid_redirect_uris = [
    "https://keycloak-7d3aa1-dev.apps.silver.devops.gov.bc.ca/auth/realms/forms-flow-ai/broker/keycloak-oidc/endpoint"
  ]
  description = "CSS App Created"
}
