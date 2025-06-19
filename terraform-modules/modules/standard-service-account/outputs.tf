output "client_id" {
  value = module.standard_service_account.client_id
}

output "client_secret" {
  value     = module.standard_service_account.client_secret
  sensitive = true
}
