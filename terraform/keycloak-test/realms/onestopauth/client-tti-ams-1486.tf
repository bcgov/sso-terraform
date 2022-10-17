module "client_tti-ams-1486" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "tti-ams-1486"
  client_name = "tti-ams-1486"
  valid_redirect_uris = [
    "https://bchrt--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcmoag--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcrb--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://cabro--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://civilresolutionbc--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardsboard--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardsboard--staging.sandbox.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardstribunal--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://lrb--staging.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://mhreviewboard--staging.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
  description = "CSS App Created"
}
