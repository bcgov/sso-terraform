variable "realm_id" {}

variable "client_id" {}

variable "attributes" {
  description = "User attributes to include in the mappers"
  type        = list(string)
  default     = []
}
