variable "realm_id" {
  description = "The realm this client is attached to."
}

variable "client_id" {
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens."
}

variable "client_name" {
  description = "The display name of this client in the GUI."
  default     = ""
}

variable "enabled" {
  description = "When false, this client will not be able to initiate a login or obtain access tokens."
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of this client in the GUI."
  default     = "Created without CSS app"
}

variable "login_theme" {
  description = "The client login theme. This will override the default theme for the realm."
  default     = ""
}

variable "valid_redirect_uris" {
  description = "When specified, Keycloak will use this list to validate given Assertion Consumer URLs specified in the authentication request."
  type        = list(string)
  default     = []
}

variable "assertion_lifespan" {
  description = "Lifespan set in the SAML assertion conditions. After that time the assertion will be invalid. The 'SessionNotOnOrAfter' attribute is not modified and continue using the 'SSO Session Max' time defined at realm level."
  default     = ""
}

variable "override_authentication_flow" {
  description = "Set to true when either of 'browser_authentication_flow' has a value."
  type        = bool
  default     = false
}

variable "browser_authentication_flow" {
  description = "Authentication browser flow id."
  default     = ""
}

variable "roles" {
  description = "Client roles to create in the openid client of the realm."
  type        = list(string)
  default     = []
}

variable "idps" {
  description = "Identity Providers; assign each as a client scope with suffix '-saml'"
  type        = list(string)
  default     = []
}

variable "additional_role_attribute" {
  description = "Additional role ttribute to have the client roles"
  default     = ""
}

variable "logout_post_binding_url" {
  description = "SAML POST Binding URL for the client's single logout service"
  default     = ""
}

variable "sign_assertions" {
  description = "When true, the SAML assertions will be signed by Keycloak using the realm's private key, and embedded within the SAML XML Auth response."
  type        = bool
  default     = false
}
