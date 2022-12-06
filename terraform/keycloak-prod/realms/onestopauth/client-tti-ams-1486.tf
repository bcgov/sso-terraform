module "client_tti-ams-1486" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_id   = "tti-ams-1486"
  client_name = "tti-ams-1486"
  valid_redirect_uris = [
    "https://bcmoag.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://cabro.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://civilresolutionbc.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardsboard.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://employmentstandardstribunal.my.salesforce.com/services/authcallback/PathfinderIdir",
    "https://mhreviewboard.my.salesforce.com/services/authcallback/PathfinderIdir"
  ]
  description = "CSS App Created"
}
