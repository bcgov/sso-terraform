output "standard_client_id" {
  value = module.standard_client.client_id
}

output "standard_client_secret" {
  value     = module.standard_client.client_secret
  sensitive = true
}

output "realm_id" {
  value = module.realm.id
}

output "realm_name" {
  value = module.realm.name
}

output "sandbox_client_id" {
  value = keycloak_openid_client.azureidir_sandbox_client.client_id
}

output "sandbox_client_secret" {
  value     = keycloak_openid_client.azureidir_sandbox_client.client_secret
  sensitive = true
}
