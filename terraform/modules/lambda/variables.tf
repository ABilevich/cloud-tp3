# ---------------------------------------------------------------------------
# Amazon Lambda variables
# ---------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = ""
}

variable "aws_caller_identity_account_id" {
  type        = string
  description = ""
}

variable "api_gateway_id" {
  type        = string
  description = ""
}

variable "api_gateway_execution_arn" {
  type        = string
  description = ""
}

variable "filename" {
  type        = string
  description = ""
}

variable "method" {
  type        = string
  description = ""
}

variable "name" {
  type        = string
  description = ""
}

variable "handler" {
  type        = string
  description = ""
}

variable "runtime" {
  type        = string
  description = ""
}

variable "path" {
  type        = string
  description = ""
}