variable "realm_id" {
  description = "The realm this client scope belongs to."
}

variable "scope_name" {
  description = "The display name of this client scope in the GUI; with suffix 'saml'"
}

variable "attributes" {
  description = "User attributes to include in the mappers"
  type        = list(string)
  default     = []
}
