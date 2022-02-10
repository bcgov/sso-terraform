module "client_demo-feb-10-2905" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "demo-feb-10-2905"
  valid_redirect_uris = [
    "https:///www.test.ca/devChange"
  ]
  description = "CSS App Created"
}
