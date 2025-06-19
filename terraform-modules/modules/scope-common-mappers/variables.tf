variable "realm_id" {}

variable "scope_name" {}

variable "add_backwards_compatible_mappers" {
  description = "if true backwards compatible mappers are added to common scope"
  type        = bool
  default     = false
}
