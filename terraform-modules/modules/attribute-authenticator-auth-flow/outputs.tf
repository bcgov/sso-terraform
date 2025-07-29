output "flow_id" {
  value = keycloak_authentication_flow.this.id
}

output "flow_alias" {
  value = keycloak_authentication_flow.this.alias
}

output "flow_exec1_id" {
  value = keycloak_authentication_execution.exec1.id
}

output "flow_exec1_authenticator" {
  value = keycloak_authentication_execution.exec1.authenticator
}
