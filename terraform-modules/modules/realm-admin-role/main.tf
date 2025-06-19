module "realm_admin" {
  source       = "../realm-management-role"
  realm_id     = var.realm_id
  role_name    = var.role_name
  group_name   = var.group_name
  target_roles = ["realm-admin"]
}
