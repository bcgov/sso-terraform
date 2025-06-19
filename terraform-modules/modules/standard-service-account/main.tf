module "standard_service_account" {
  source = "../oidc-client"

  realm_id = var.realm_id

  client_id   = var.client_id
  name        = var.client_name
  description = var.description

  enabled                  = var.enabled
  service_accounts_enabled = true

  access_type = "CONFIDENTIAL"

  backchannel_logout_session_required = false

  access_token_lifespan               = var.access_token_lifespan
  client_offline_session_idle_timeout = var.client_offline_session_idle_timeout
  client_offline_session_max_lifespan = var.client_offline_session_max_lifespan
  client_session_idle_timeout         = var.client_session_idle_timeout
  client_session_max_lifespan         = var.client_session_max_lifespan
}

resource "keycloak_openid_client_default_scopes" "idp_scopes" {
  realm_id  = var.realm_id
  client_id = module.standard_service_account.id

  default_scopes = []
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = module.standard_service_account.id

  optional_scopes = []
}

resource "keycloak_generic_protocol_mapper" "team_mapper" {
  realm_id        = var.realm_id
  client_id       = module.standard_service_account.id
  name            = "team"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-hardcoded-claim-mapper"
  config = {
    "access.token.claim" : "true",
    "access.tokenResponse.claim" : "false",
    "claim.name" : "team",
    "claim.value" : var.team_id,
    "id.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}
