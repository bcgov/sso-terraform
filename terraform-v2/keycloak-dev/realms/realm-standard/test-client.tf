resource "keycloak_openid_client" "test_client" {
  realm_id = module.realm.id

  client_id = "test_client"
  name      = "test_client"

  enabled                      = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type   = "PUBLIC"
  client_secret = "<UPDATE_ME>"

  valid_redirect_uris = ["*"]
  web_origins         = ["*"]

  authentication_flow_binding_overrides {
    browser_id = module.idp_auth_flow.flow_id
    # direct_grant_id =
  }
}
resource "keycloak_role" "client_role1" {
  realm_id    = module.realm.id
  client_id   = keycloak_openid_client.test_client.id
  name        = "client_role1"
  description = "client_role1"
}


resource "keycloak_role" "client_role2" {
  realm_id    = module.realm.id
  client_id   = keycloak_openid_client.test_client.id
  name        = "client_role2"
  description = "client_role2"
}

resource "keycloak_role" "admin_role" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.test_client.id
  name      = "admin_role"
  composite_roles = [
    keycloak_role.client_role2.id,
    keycloak_role.client_role1.id,
  ]
}

resource "keycloak_openid_client_default_scopes" "client_standard_default_scopes" {
  realm_id  = module.realm.id
  client_id = keycloak_openid_client.test_client.id

  default_scopes = [
    "profile",
    "email",
  ]
}
