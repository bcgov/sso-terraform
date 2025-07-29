variable "realm_id" {
  description = "The realm name to create the role in"
  type        = string
}

variable "role_name" {
  description = "The admin role name"
  type        = string
  default     = "realm-admin"
}

variable "group_name" {
  description = "The admin group name"
  type        = string
  default     = "Realm Administrator"
}
