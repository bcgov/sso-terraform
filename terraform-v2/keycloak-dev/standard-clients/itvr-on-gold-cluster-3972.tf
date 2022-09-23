data "keycloak_authentication_flow" "itvr_on_gold_cluster_3972_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "itvr-on-gold-cluster-3972" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "itvr-on-gold-cluster-3972"
  client_name                         = "ITVR on Gold Cluster"
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "bceidbasic",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.itvr_on_gold_cluster_3972_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000/*",
    "https://itvr-dev-244.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
  standard_flow_enabled    = true
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://itvr-dev-244.apps.silver.devops.gov.bc.ca/*"
  ]
}
