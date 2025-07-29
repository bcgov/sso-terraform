provider "keycloak" {
  client_id = "admin-cli"
  username  = var.username
  password  = var.password
  url       = "${var.keycloak_url}/auth"
}
