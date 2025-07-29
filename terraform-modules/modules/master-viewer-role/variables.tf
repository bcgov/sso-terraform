variable "role_name" {
  description = "The viewer role name"
  type        = string
  default     = "viewer"
}

variable "realm_names" {
  description = "The target realm names to assign privileges for."
  type        = list(string)
}
