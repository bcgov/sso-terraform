variable "realm_id" {
  description = "The realm name to create the role in"
  type        = string
}

variable "role_name" {
  description = "The viewer role name"
  type        = string
  default     = "realm-viewer"
}

variable "group_name" {
  description = "The viewer group name"
  type        = string
  default     = "Realm Viewer"
}
