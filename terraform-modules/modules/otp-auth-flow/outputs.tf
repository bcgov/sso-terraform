output "flow_id" {
  value = keycloak_authentication_flow.this.id
}

output "flow_alias" {
  value = keycloak_authentication_flow.this.alias
}
