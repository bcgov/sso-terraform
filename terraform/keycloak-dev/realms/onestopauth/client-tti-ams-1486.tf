module "client_tti-ams-1486" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "tti-ams-1486"
  valid_redirect_uris = [
    "https://bchrt--qa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcmoag--qa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://bcrb--newqa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://cabro--qa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://civilresolutionbc--amsqa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardsboard--qa04.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardstribunal--qa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://lrb--qa.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://mhreviewboard--qa.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
  description = "CSS App Created"
}
