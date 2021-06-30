module "client_workflow-example" {
  source      = "../../../modules/openid-client"
  realm_id    = data.keycloak_realm.this.id
  client_name = "workflow-example"
  valid_redirect_uris = [
    "*"
  ]
}
