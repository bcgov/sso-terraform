resource "keycloak_authentication_flow" "this" {
  realm_id = var.realm_id
  alias    = var.auth_flow_alias
}

resource "keycloak_authentication_execution" "exec1" {
  realm_id          = var.realm_id
  parent_flow_alias = keycloak_authentication_flow.this.alias
  authenticator     = "user-attribute-authenticator"
  requirement       = "REQUIRED"
}
