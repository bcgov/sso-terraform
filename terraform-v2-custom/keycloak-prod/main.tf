module "custom_realms" {
  source = "./custom-realms"
}

module "master_viewer_role" {
  source    = "github.com/bcgov/sso-terraform-modules?ref=main/modules/master-viewer-role"
  role_name = "viewer-custom-realms"
  realm_names = [
    "bcparks-service-transformation",
    "health-gateway-gold",
    "platform-services"
  ]

  depends_on = [
    module.custom_realms,
  ]
}
