module "tti-ams-gold-4259" {
  source                              = "github.com/bcgov/sso-terraform-modules?ref=main/modules/standard-client"
  realm_id                            = var.standard_realm_id
  client_id                           = "tti-ams-gold-4259"
  client_name                         = "TTI AMS Gold"
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
  additional_role_attribute    = ""
  login_theme                  = ""
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.idp_stopper.id
  standard_flow_enabled        = true
  service_accounts_enabled     = false
  valid_redirect_uris = [
    "https://bchrt--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcmoag--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcrb--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://cabro--staging.sandbox.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://civilresolutionbc--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://civilresolutionbc--staging.sandbox.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardsboard--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardstribunal--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://lrb--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://mhreviewboard--staging.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
}
