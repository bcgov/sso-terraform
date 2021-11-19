module "client_work-bc-job-board-496" {
  source      = "github.com/bcgov/sso-terraform-keycloak-client?ref=main"
  realm_id    = data.keycloak_realm.this.id
  client_name = "work-bc-job-board-496"
  valid_redirect_uris = [
    "https://dev-admin-jobboard.workbc.ca/*",
    "https://localhost:44364/*"
  ]
  web_origins           = ["https://dev-admin-jobboard.workbc.ca, https://localhost:44364"]
}
