variable "realm_id" {}
variable "client_id" {}
variable "valid_redirect_uris" {}
variable "public_attrs" {}
variable "sub_to_username" {
  description = "If true, override 'sub' to have 'username' property value"
  type        = bool
  default     = false
}
