# see https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/oidc_identity_provider
variable "realm_id" {
  description = "The ID of the Keycloak realm."
}

variable "alias" {
  description = "The alias uniquely identifies an identity provider and it is also used to build the redirect uri."
}

variable "authorization_url" {
  description = "The Authorization Url."
}

variable "client_id" {
  description = "The client or client identifier registered within the identity provider."
}

variable "client_secret" {
  description = "The client or client secret registered within the identity provider. This field is able to obtain its value from vault, use $${vault.ID} format."
}

variable "token_url" {
  description = "The Token URL."
}

variable "display_name" {
  description = "Display name for the identity provider in the GUI."
  default     = ""
}

variable "enabled" {
  description = "When true, users will be able to log in to this realm using this identity provider."
  default     = true
}

variable "store_token" {
  description = "When true, tokens will be stored after authenticating users."
  default     = false
}

variable "add_read_token_role_on_create" {
  description = "When true, new users will be able to read stored tokens. This will automatically assign the broker.read-token role."
  default     = false
}

variable "link_only" {
  description = "When true, users cannot login using this provider, but their existing accounts will be linked when possible."
  default     = false
}

variable "trust_email" {
  description = "When true, email addresses for users in this provider will automatically be verified regardless of the realm's email verification policy."
  default     = false
}

variable "first_broker_login_flow_alias" {
  description = "The authentication flow to use when users log in for the first time through this identity provider."
  default     = "first broker login"
}

variable "post_broker_login_flow_alias" {
  description = "The authentication flow to use after users have successfully logged in, which can be used to perform additional user verification (such as OTP checking)."
  default     = ""
}

variable "provider_id" {
  description = "The authentication flow to use after users have successfully logged in, which can be used to perform additional user verification (such as OTP checking)."
  default     = "oidc"
}

variable "backchannel_supported" {
  description = "Does the external IDP support backchannel logout?"
  default     = true
}

variable "validate_signature" {
  description = "Enable/disable signature validation of external IDP signatures."
  default     = true
}

variable "user_info_url" {
  description = "User Info URL."
  default     = ""
}

variable "jwks_url" {
  description = "JSON Web Key Set URL."
  default     = ""
}

variable "disable_user_info" {
  description = "When true, disables the usage of the user info service to obtain additional user information."
  default     = false
}

variable "hide_on_login_page" {
  description = "When true, this provider will be hidden on the login page, and is only accessible when requested explicitly."
  default     = false
}

variable "logout_url" {
  description = "The Logout URL is the end session endpoint to use to logout user from external identity provider."
  default     = ""
}

variable "login_hint" {
  description = "Pass login hint to identity provider."
  default     = false
}

variable "ui_locales" {
  description = "Pass current locale to identity provider."
  default     = false
}

variable "accepts_prompt_none_forward_from_client" {
  description = "When true, the IDP will accept forwarded authentication requests that contain the prompt=none query parameter."
  default     = false
}

variable "default_scopes" {
  description = "The scopes to be sent when asking for authorization. It can be a space-separated list of scopes."
  default     = "openid"
}

variable "sync_mode" {
  description = "The default sync mode to use for all mappers attached to this identity provider. Can be once of IMPORT, FORCE, or LEGACY."
  default     = "FORCE"
}

variable "gui_order" {
  description = "A number defining the order of this identity provider in the GUI."
  default     = ""
}

variable "client_auth_method" {
  description = "The client authentication method. Since Keycloak 8, this is a required attribute if OIDC provider is created using the Keycloak GUI. It accepts the values client_secret_post (Client secret sent as post), client_secret_basic (Client secret sent as basic auth), client_secret_jwt (Client secret as jwt) and private_key_jwt (JTW signed with private key)"
  default     = "client_secret_post"
}

variable "forwardParameters" {
  description = "Non OpenID Connect/OAuth standard query parameters to be forwarded to external IDP from the initial application request to Authorization Endpoint. Multiple parameters can be entered, separated by comma (,)."
  default     = ""
}

variable "tooltip" {
  description = "The tooltip to display inside the IDP login button (HTML format)"
  default     = ""
}

variable "idp_extra_config" {
  description = "Optional extra configuration block"
  type        = any
  default     = null
}
