module "client_workflow-example-2" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "workflow-example-2"
  valid_redirect_uris = [
    "*"
  ]
}
