data "keycloak_authentication_flow" "bc_data_catalogue_3863_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "bc-data-catalogue-3863" {
  source      = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_id   = "bc-data-catalogue-3863"
  client_name = "BC Data Catalogue"
  valid_redirect_uris = [
    "https://catalogue.data.gov.bc.ca/client-api/callback"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "common"
  ]
  description                  = "CSS App Created"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.bc_data_catalogue_3863_browserflow.id
}
