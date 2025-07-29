data "keycloak_openid_client" "realm_management" {
  realm_id  = var.realm_id
  client_id = var.client_id
}

data "keycloak_role" "target_roles" {
  for_each = toset(var.target_roles)

  realm_id  = var.realm_id
  client_id = data.keycloak_openid_client.realm_management.id
  name      = each.key
}

# create a role
resource "keycloak_role" "role" {
  realm_id = var.realm_id
  name     = var.role_name

  composite_roles = concat(
    [for v in values(data.keycloak_role.target_roles) : v.id],
  )
}

# create a service account that has the role
resource "keycloak_openid_client" "service_account" {
  realm_id = var.realm_id

  client_id = "${var.role_name}-cli"
  name      = "${var.role_name}-cli"

  enabled                      = true
  standard_flow_enabled        = false
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = true

  access_type = "CONFIDENTIAL"
}

resource "keycloak_openid_client_service_account_realm_role" "role_service_account_binding" {
  realm_id                = var.realm_id
  service_account_user_id = keycloak_openid_client.service_account.service_account_user_id
  role                    = keycloak_role.role.name
}

# create a group that has the role
resource "keycloak_group" "group" {
  realm_id = var.realm_id
  name     = var.group_name
}

resource "keycloak_group_roles" "role_group_binding" {
  realm_id = var.realm_id
  group_id = keycloak_group.group.id

  role_ids = [
    keycloak_role.role.id
  ]
}
