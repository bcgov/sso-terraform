output "client_id" {
  value = module.standard_oidc_client.client_id
}

output "client_secret" {
  value     = module.standard_oidc_client.client_secret
  sensitive = true
}
