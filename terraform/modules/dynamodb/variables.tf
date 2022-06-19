# ---------------------------------------------------------------------------
# Amazon DynamoDB variables
# ---------------------------------------------------------------------------

variable "app_name" {
  type        = string
  description = "App Name"
}

variable "name_prefix" {
  type        = string
  description = "Tables Name Prefix"
  default     = ""
}

variable "tables" {
  type        = map(any)
  description = "DynamoDB Tables"
}