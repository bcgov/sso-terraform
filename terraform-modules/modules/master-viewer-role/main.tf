data "keycloak_openid_client" "clients" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = "${each.key}-realm"
}

data "keycloak_role" "view_realm" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-realm"
}

data "keycloak_role" "view_users" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-users"
}

data "keycloak_role" "view_clients" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-clients"
}

data "keycloak_role" "view_events" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-events"
}

data "keycloak_role" "view_identity_providers" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-identity-providers"
}

data "keycloak_role" "view_authorization" {
  for_each = toset(var.realm_names)

  realm_id  = "master"
  client_id = data.keycloak_openid_client.clients[each.key].id
  name      = "view-authorization"
}

resource "keycloak_role" "viewer" {
  realm_id = "master"
  name     = var.role_name

  composite_roles = concat(
    [for v in values(data.keycloak_role.view_realm) : v.id],
    [for v in values(data.keycloak_role.view_users) : v.id],
    [for v in values(data.keycloak_role.view_clients) : v.id],
    [for v in values(data.keycloak_role.view_events) : v.id],
    [for v in values(data.keycloak_role.view_identity_providers) : v.id],
    [for v in values(data.keycloak_role.view_authorization) : v.id]
  )
}

resource "keycloak_openid_client" "viewer_service_account" {
  realm_id = "master"

  client_id = "${var.role_name}-cli"
  name      = "${var.role_name}-cli"

  enabled                      = true
  standard_flow_enabled        = false
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = true

  access_type = "CONFIDENTIAL"
}

resource "keycloak_openid_client_service_account_realm_role" "viewer_service_account_viewer_role" {
  realm_id                = "master"
  service_account_user_id = keycloak_openid_client.viewer_service_account.service_account_user_id
  role                    = keycloak_role.viewer.name
}
