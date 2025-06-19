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
