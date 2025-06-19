variable "realm_id" {
  description = "The realm this client is attached to."
  type        = string
}

variable "client_id" {
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens."
  type        = string
}

variable "client_name" {
  description = "The display name of this client in the GUI."
  default     = ""
  type        = string
}

variable "enabled" {
  description = "When false, this client will not be able to initiate a login or obtain access tokens."
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of this client in the GUI."
  default     = "Created without CSS app"
  type        = string
}

variable "login_theme" {
  description = "The client login theme. This will override the default theme for the realm."
  default     = ""
  type        = string
}

variable "valid_redirect_uris" {
  description = "When specified, Keycloak will use this list to validate given Assertion Consumer URLs specified in the authentication request."
  type        = list(string)
  default     = []
}

variable "assertion_lifespan" {
  description = "Lifespan set in the SAML assertion conditions. After that time the assertion will be invalid. The 'SessionNotOnOrAfter' attribute is not modified and continue using the 'SSO Session Max' time defined at realm level."
  default     = ""
  type        = string
}

variable "override_authentication_flow" {
  description = "Set to true when either of 'browser_authentication_flow' has a value."
  type        = bool
  default     = false
}

variable "browser_authentication_flow" {
  description = "Authentication browser flow id."
  default     = ""
  type        = string
}

variable "client_signature_required" {
  description = "When true, Keycloak will expect that documents originating from a client will be signed using the certificate and/or key configured via signing_certificate and signing_private_key."
  type        = bool
  default     = true
}

variable "encrypt_assertions" {
  description = "When true, the SAML assertions will be encrypted by Keycloak using the client's public key."
  type        = bool
  default     = true
}

variable "attributes" {
  description = "User attributes to include in the mappers"
  type        = list(string)
  default     = []
}
