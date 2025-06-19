module "realm_viewer" {
  source       = "../realm-management-role"
  realm_id     = var.realm_id
  role_name    = var.role_name
  group_name   = var.group_name
  target_roles = ["view-realm", "view-users", "view-clients", "view-identity-providers", "view-authorization", "view-events"]
}
