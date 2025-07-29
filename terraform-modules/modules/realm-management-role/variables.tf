variable "realm_id" {
  description = "The realm name to create the role in"
  type        = string
}

variable "client_id" {
  description = "The client to find the target roles"
  type        = string
  default     = "realm-management"
}

variable "role_name" {
  description = "The role name"
  type        = string
}

variable "group_name" {
  description = "The group name"
  type        = string
}

variable "target_roles" {
  description = "The roles that this role wants to have privileges on"
  type        = list(string)
}
