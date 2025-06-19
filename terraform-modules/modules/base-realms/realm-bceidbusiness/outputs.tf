output "standard_client_id" {
  value = module.standard_client.client_id
}

output "standard_client_secret" {
  value     = module.standard_client.client_secret
  sensitive = true
}

output "sandbox_client_id" {
  value = module.sandbox_client.client_id
}
