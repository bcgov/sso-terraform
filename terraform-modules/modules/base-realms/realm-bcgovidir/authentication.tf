resource "keycloak_authentication_flow" "first_broker_login_auto_link_user" {
  realm_id = module.realm.id
  alias    = "first broker login - multiple federated links"
}

resource "keycloak_authentication_subflow" "first_broker_login_auto_link_user_creation_linking" {
  realm_id          = module.realm.id
  alias             = "first broker login new User creation or linking"
  description       = "Flow for the existing/non-existing user alternatives"
  parent_flow_alias = keycloak_authentication_flow.first_broker_login_auto_link_user.alias
  provider_id       = "basic-flow"
  requirement       = "REQUIRED"
  priority          = 20
}

resource "keycloak_authentication_execution" "first_broker_login_auto_link_user_create_unique_user" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_auto_link_user_creation_linking.alias
  authenticator     = "idp-create-user-if-unique"
  requirement       = "ALTERNATIVE"
  priority          = 10
}

resource "keycloak_authentication_execution_config" "first_broker_login_auto_link_user_create_unique_user_config" {
  realm_id     = keycloak_realm.realm.id
  execution_id = keycloak_authentication_execution.first_broker_login_auto_link_user_create_unique_user.id
  alias        = "first broker login new create unique user config"
  config = {
    "require.password.update.after.registration" = false
  }
}

resource "keycloak_authentication_execution" "first_broker_login_auto_link_user" {
  realm_id          = module.realm.id
  parent_flow_alias = keycloak_authentication_subflow.first_broker_login_auto_link_user_creation_linking.alias
  authenticator     = "idp-auto-link"
  requirement       = "ALTERNATIVE"
  priority          = 10
}
