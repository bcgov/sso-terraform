# see https://registry.terraform.io/providers/mrparkers/keycloak/latest/docs/resources/realm_events
resource "keycloak_realm_events" "this" {
  realm_id = var.realm_id

  admin_events_enabled         = var.admin_events_enabled
  admin_events_details_enabled = var.admin_events_details_enabled

  events_enabled      = var.events_enabled
  events_expiration   = var.events_expiration
  enabled_event_types = var.enabled_event_types
  events_listeners    = var.events_listeners
}
