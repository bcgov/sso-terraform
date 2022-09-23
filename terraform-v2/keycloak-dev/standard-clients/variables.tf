variable "standard_realm_id" {}

data "keycloak_authentication_flow" "idp_stopper" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
