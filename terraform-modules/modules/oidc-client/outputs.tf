output "id" {
  value = keycloak_openid_client.this.id
}

output "name" {
  value = keycloak_openid_client.this.name
}

output "client_id" {
  value = keycloak_openid_client.this.client_id
}

output "client_secret" {
  value     = keycloak_openid_client.this.client_secret
  sensitive = true
}
