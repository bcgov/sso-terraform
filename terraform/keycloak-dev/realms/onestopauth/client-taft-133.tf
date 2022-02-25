module "client_taft-133" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "taft-133"
  valid_redirect_uris = [
    "https://iam3.aot-technologies.com/auth/realms/formsflow-ai-maple/broker/idir/endpoint/*",
    "https://idm-dev-taft.apps.silver.devops.gov.bc.ca/auth/realms/taft/broker/idir/endpoint/*",
    "https://idm-dev.taft.fin.gov.bc.ca/auth/realms/taft/broker/idir/endpoint/*",
    "https://idm-formsflow-abhilash-helm.apps.devops.aot-technologies.com/auth/realms/forms-flow-ai/broker/idir/endpoint/*",
    "https://localhost:3000/*",
    "https://localhost:8080/auth/realms/taft/broker/idir/endpoint"
  ]
  description = "CSS App Created"
}
