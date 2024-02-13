provider "keycloak" {
  realm     = "master"
  client_id = var.client_id
  username  = var.username
  password  = var.password
  url       = "${var.keycloak_url}/auth"
}
