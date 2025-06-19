variable "realm_id" {
  description = "The realm this client is attached to."
}

variable "client_id" {
  description = "The unique ID of this client, referenced in the URI during authentication and in issued tokens."
}

variable "name" {
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
  default     = ""
}

variable "login_theme" {
  description = "The client login theme. This will override the default theme for the realm."
  default     = ""
}

variable "include_authn_statement" {
  description = "When true, an AuthnStatement will be included in the SAML response."
  type        = bool
  default     = true
}

variable "sign_documents" {
  description = "When true, the SAML document will be signed by Keycloak using the realm's private key."
  type        = bool
  default     = true
}

variable "sign_assertions" {
  description = "When true, the SAML assertions will be signed by Keycloak using the realm's private key, and embedded within the SAML XML Auth response."
  type        = bool
  default     = false
}

variable "encrypt_assertions" {
  description = "When true, the SAML assertions will be encrypted by Keycloak using the client's public key."
  type        = bool
  default     = false
}

variable "client_signature_required" {
  description = "When true, Keycloak will expect that documents originating from a client will be signed using the certificate and/or key configured via signing_certificate and signing_private_key."
  type        = bool
  default     = false
}

variable "force_post_binding" {
  description = "When true, Keycloak will always respond to an authentication request via the SAML POST Binding."
  type        = bool
  default     = true
}

variable "front_channel_logout" {
  description = "When true, this client will require a browser redirect in order to perform a logout."
  type        = bool
  default     = true
}

variable "name_id_format" {
  description = "Sets the Name ID format for the subject. Should be one of 'username', 'email', 'transient', 'persistent'"
  default     = "username"
}

variable "force_name_id_format" {
  description = "Ignore requested NameID subject format and use the one defined in name_id_format instead."
  type        = bool
  default     = false
}

variable "signature_algorithm" {
  description = "The signature algorithm used to sign documents. Should be one of 'RSA_SHA1', 'RSA_SHA256', 'RSA_SHA512', or 'DSA_SHA1'."
  default     = "RSA_SHA256"
}

variable "canonicalization_method" {
  description = "The Canonicalization Method for XML signatures. Should be one of 'EXCLUSIVE', 'EXCLUSIVE_WITH_COMMENTS', 'INCLUSIVE', or 'INCLUSIVE_WITH_COMMENTS'."
  default     = "EXCLUSIVE"
}

variable "root_url" {
  description = "When specified, this value is prepended to all relative URLs."
  default     = ""
}

variable "valid_redirect_uris" {
  description = "When specified, Keycloak will use this list to validate given Assertion Consumer URLs specified in the authentication request."
  type        = list(string)
  default     = []
}

variable "base_url" {
  description = "When specified, this URL will be used whenever Keycloak needs to link to this client."
  default     = ""
}

variable "master_saml_processing_url" {
  description = "When specified, this URL will be used for all SAML requests."
  default     = ""
}

variable "encryption_certificate" {
  description = "If assertions for the client are encrypted, this certificate will be used for encryption."
  default     = ""
}

variable "signing_certificate" {
  description = "If documents or assertions from the client are signed, this certificate will be used to verify the signature."
  default     = ""
}

variable "signing_private_key" {
  description = "If documents or assertions from the client are signed, this private key will be used to verify the signature."
  default     = ""
}

variable "idp_initiated_sso_url_name" {
  description = "URL fragment name to reference client when you want to do IDP Initiated SSO."
  default     = ""
}

variable "idp_initiated_sso_relay_state" {
  description = "Relay state you want to send with SAML request when you want to do IDP Initiated SSO."
  default     = ""
}

variable "assertion_consumer_post_url" {
  description = "SAML POST Binding URL for the client's assertion consumer service (login responses)."
  default     = ""
}

variable "assertion_consumer_redirect_url" {
  description = "SAML Redirect Binding URL for the client's assertion consumer service (login responses)."
  default     = ""
}

variable "logout_service_post_binding_url" {
  description = "SAML POST Binding URL for the client's single logout service."
  default     = ""
}

variable "logout_service_redirect_binding_url" {
  description = "SAML Redirect Binding URL for the client's single logout service."
  default     = ""
}

variable "full_scope_allowed" {
  description = "Whether or not to allow to include all roles mappings in the access token."
  type        = bool
  default     = false
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
