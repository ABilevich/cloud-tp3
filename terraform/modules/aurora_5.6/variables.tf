# ------------------------------------------------------------------------
# Amazon Aurora RDS PostgreSQL variables
# ------------------------------------------------------------------------

variable "name" {
  type        = string
  description = "The name of the db. Must be less than or equal to 63 characters in length."
}

variable "tags" {
  type        = map(any)
  description = ""
  default     = {}
}

variable "vpc_id" {
    type      = string
    description = "VPC ID"
}