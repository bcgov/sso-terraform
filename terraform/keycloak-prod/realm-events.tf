module "realm_events" {
  source   = "../modules/realm-events"
  for_each = { for v in var.prod_event_realms : v => v }

  realm_id = each.value
}
