module "client_tidd-salesforce-2707" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tidd-salesforce-2707"
  valid_redirect_uris = [
    "https://tradeandinvestbc--meldev.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
  description = "CSS App Created"
}
