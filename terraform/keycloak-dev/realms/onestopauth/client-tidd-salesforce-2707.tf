module "client_tidd-salesforce-2707" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tidd-salesforce-2707"
  valid_redirect_uris = [
    "https://tradeandinvestbc--meldev.my.salesforce.com/services/authcallback/BCGovSSOIdir",
    "https://tradeandinvestbclightning--dev.my.salesforce.com/services/authcallback/BCGovSSOIdir"
  ]
  description = "CSS App Created"
}
