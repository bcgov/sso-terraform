# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/saml_identity_provider
variable "realm_id" {
  description = "The ID of the Keycloak realm."
}

variable "alias" {
  description = "The unique name of identity provider."
}

variable "enabled" {
  description = "When false, users and clients will not be able to access this realm. Defaults to true."
  default     = true
}

variable "display_name" {
  description = "The display name for the realm that is shown when logging in to the admin console."
  default     = ""
}

variable "store_token" {
  description = "When true, tokens will be stored after authenticating users."
  default     = false
}

variable "add_read_token_role_on_create" {
  description = "When true, new users will be able to read stored tokens. This will automatically assign the broker.read-token role."
  default     = false
}

variable "trust_email" {
  description = "When true, email addresses for users in this provider will automatically be verified regardless of the realm's email verification policy."
  default     = false
}

variable "link_only" {
  description = "When true, users cannot login using this provider, but their existing accounts will be linked when possible."
  default     = false
}

variable "hide_on_login_page" {
  description = "If hidden, then login with this provider is possible only if requested explicitly, e.g. using the 'kc_idp_hint' parameter."
  default     = false
}

variable "first_broker_login_flow_alias" {
  description = "Alias of authentication flow, which is triggered after first login with this identity provider. Term 'First Login' means that there is not yet existing Keycloak account linked with the authenticated identity provider account."
  default     = "first broker login"
}

variable "post_broker_login_flow_alias" {
  description = "Alias of authentication flow, which is triggered after each login with this identity provider. Useful if you want additional verification of each user authenticated with this identity provider (for example OTP). Leave this empty if you don't want any additional authenticators to be triggered after login with this identity provider. Also note, that authenticator implementations must assume that user is already set in ClientSession as identity provider already set it."
  default     = ""
}

variable "authenticate_by_default" {
  description = "Authenticate users by default."
  default     = false
}

variable "entity_id" {
  description = "The Entity ID that will be used to uniquely identify this SAML Service Provider."
}

variable "single_sign_on_service_url" {
  description = "The Url that must be used to send authentication requests (SAML AuthnRequest)."
}

variable "single_logout_service_url" {
  description = "The Url that must be used to send logout requests."
  default     = ""
}

variable "backchannel_supported" {
  description = "Does the external IDP support back-channel logout ?."
  default     = false
}

variable "name_id_policy_format" {
  description = "Specifies the URI reference corresponding to a name identifier format. Defaults to empty."
  default     = "Persistent"
}

variable "principal_type" {
  description = "Way to identify and track external users from the assertion. Default is using Subject NameID, alternatively you can set up identifying attribute."
  default     = "SUBJECT"
}

variable "post_binding_response" {
  description = "Indicates whether to respond to requests using HTTP-POST binding. If false, HTTP-REDIRECT binding will be used."
  default     = true
}

variable "post_binding_authn_request" {
  description = "Indicates whether the AuthnRequest must be sent using HTTP-POST binding. If false, HTTP-REDIRECT binding will be used."
  default     = true
}

variable "post_binding_logout" {
  description = "Indicates whether to respond to requests using HTTP-POST binding. If false, HTTP-REDIRECT binding will be used."
  default     = false
}

variable "want_assertions_signed" {
  description = "Indicates whether this service provider expects a signed Assertion."
  default     = false
}

variable "want_assertions_encrypted" {
  description = "Indicates whether this service provider expects an encrypted Assertion."
  default     = false
}

variable "force_authn" {
  description = "Indicates whether the identity provider must authenticate the presenter directly rather than rely on a previous security context."
  default     = true
}

variable "validate_signature" {
  description = "Enable/disable signature validation of SAML responses."
  default     = true
}

variable "signing_certificate" {
  description = "Signing Certificate."
  default     = ""
}

variable "signature_algorithm" {
  description = "Signing Algorithm. Defaults to empty."
  default     = ""
}

variable "xml_sign_key_info_key_name_transformer" {
  description = "Sign Key Transformer. Defaults to empty."
  default     = ""
}

variable "sync_mode" {
  description = "The default sync mode to use for all mappers attached to this identity provider. Can be once of IMPORT, FORCE, or LEGACY."
  default     = "FORCE"
}

variable "gui_order" {
  description = "A number defining the order of this identity provider in the GUI."
  default     = ""
}
