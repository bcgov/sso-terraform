data "keycloak_authentication_flow" "idp_stopper" {
  realm_id = module.standard.realm_id
  alias    = "idp stopper"
}

resource "keycloak_openid_client" "test_client" {
  realm_id = module.standard.realm_id

  client_id = "test-client"
  name      = "SSO Dev Test"

  enabled                      = true
  standard_flow_enabled        = true
  implicit_flow_enabled        = false
  direct_access_grants_enabled = false
  service_accounts_enabled     = false

  access_type   = "PUBLIC"
  client_secret = ""

  valid_redirect_uris = ["https://bcgov.github.io/keycloak-example-apps/*"]
  web_origins         = ["+"]

  authentication_flow_binding_overrides {
    browser_id = data.keycloak_authentication_flow.idp_stopper.id
  }
}

resource "keycloak_openid_client_default_scopes" "test_client_default_scopes" {
  realm_id  = module.standard.realm_id
  client_id = keycloak_openid_client.test_client.id

  default_scopes = [
    "profile",
    "email",
    "common",
    "idir",
    "azureidir",
    "bceidbasic",
    "bceidbusiness",
    "bceidboth",
    "github",
  ]
}
