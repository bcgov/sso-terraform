locals {
  target_realms = []
  # target_realms = ["v45fd2kb"]
}

module "realm_events" {
  source   = "../modules/realm-events"
  for_each = { for v in local.target_realms : v => v }

  realm_id = each.value
}
