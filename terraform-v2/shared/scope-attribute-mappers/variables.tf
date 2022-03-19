variable "realm_id" {}

variable "scope_name" {}

variable "attributes" {
  description = "User attributes to include in the mappers"
  type        = list(string)
  default     = []
}
