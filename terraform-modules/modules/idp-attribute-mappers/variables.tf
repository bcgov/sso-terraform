variable "realm_id" {}

variable "idp_alias" {}

variable "attributes" {
  description = "User attributes to include in the mappers"
  type        = list(string)
  default     = []
}
